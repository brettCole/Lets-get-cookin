class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def Create
    @user = User.new(user_params)
    if @user.valid? && @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    current_user
    @recipes = current_user.recipes.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :provider, :uid, :name)
  end

end
