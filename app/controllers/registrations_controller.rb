class RegistrationsController < Devise::RegistrationsController
  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if current_user.authorizations.count > 0
      params.delete('current_password')
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:password, :password_confirmation, :email, :document, :name,
                                 :phone, :social_reason, :fantasy_name)
  end

  def account_update_params
    params.require(:user).permit(:password, :password_confirmation, :email, :image, :document, :name,
                                 :phone, :social_reason, :fantasy_name, :current_password)
  end

  protected

  def after_update_path_for(_resource)
    eu_path
  end
end
