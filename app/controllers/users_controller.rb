class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def show
    # Assuming you want to show the current user's profile
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  # This method ensures that the user can only edit their own profile.
  # Since we're now using current_user directly in set_user, correct_user method might not be necessary.
  # If you keep it, you can simplify or remove it as it would always be true.
  def correct_user
    redirect_to(root_path) unless User.find(params[:id]) == current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
