class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_auth_for_user, only: [:edit, :update]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render 'devise/registrations/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :document, :name, :id,
                                 :phone, :social_reason, :fantasy_name)
  end

  def validate_auth_for_user
    redirect_to root_path unless @user == current_user
  end
end