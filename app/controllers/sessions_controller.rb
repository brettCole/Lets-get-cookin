class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth
      @user = User.sign_in_with_auth(auth)
      session[:id] = @user.id
    else
      @user = User.find_by(email: params[:email])
      if @user == @user.authenticate(params[:password]) && @user.provider.nil?
        session[:id] = @user.id
      end
    end
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:id)
    redirect_to '/'
  end

end
