class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]
  def new; end

  def create
    auth = request.env['omniauth.auth']
    if auth
      @user = User.sign_in_with_auth(auth)
      session[:id] = @user.id
      redirect_to user_path(@user)

    elsif @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect_to user_path(@user)
      else
        flash.now[:error] = 'Email Or Password Do Not Match'
        render :new
      end

    elsif !User.find_by_email(params[:email]) || params[:email] == "" || params[:password] == ""
      flash.now[:error] = 'Email and Password Are Incorrect!'
      render :new
    end
  end

  def destroy
    session.delete(:id)
    redirect_to '/'
  end
end
