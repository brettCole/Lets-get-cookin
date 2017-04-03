class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth
      @user = User.sign_in_with_auth(auth)
      session[:id] = @user.id
      redirect_to user_path(@user)

    elsif params[:email] == "" || params[:password] == ""
      flash.now[:error] = "Email and Password Can Not Be Blank!"
      render :new

    elsif !User.find_by_email(params[:email])
      flash.now[:error] = "Email or Password Are Incorrect!"
      render :new

    elsif @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password]) && @user.provider.nil?
        session[:id] = @user.id
        redirect_to user_path(@user)
      end
    end
  end

  def destroy
    session.delete(:id)
    redirect_to '/'
  end

end
