class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.required(:user).permit(:fist_name, :last_name)
  end
end
