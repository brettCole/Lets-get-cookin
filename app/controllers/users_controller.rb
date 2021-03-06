class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
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

  def edit
    @user = current_user
  end

  def destroy
    current_user.destroy && reset_session
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :provider, :uid, :name)
  end
end
