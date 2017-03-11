class SessionsController < ApplicationController

  def new
  end

  def create
    # auth = request.env["omniauth.auth"]
    # if auth
    #   @user = User.sign_in_with_auth(auth)
    #   session[:id] = @user.id
    # else
    #   @user = User.find_by_email(params[:email])
    #   if @user == @user.authenticate(params[:password]) && @user.provider.nil?
    #     session[:id] = @user.id
    #   else
    #     render :new
    #   end
    # end
    # redirect_to user_path(@user)
    auth = request.env["omniauth.auth"]
    if auth
      @user = User.sign_in_with_auth(auth)
      session[:id] = @user.id
      redirect_to user_path(@user)

    elsif params[:email] = '' || params[:password] = ''
      flash.now[:error] = "Email and Password Cannot Be Blank!"
      render :new

    else
      @user = User.find_by_email(params[:email])
      @user == @user.authenticate(params[:password]) && @user.provider.nil?
      session[:id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete(:id)
    redirect_to '/'
  end

end
