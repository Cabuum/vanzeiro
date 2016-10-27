class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  def all
    p env['omniauth.auth']
    user = User.from_omniauth(env['omniauth.auth'], current_user)
    if user.persisted?
      flash[:notice] = 'Seja bem vindo(a)!! Aproveite e veja a sua situação atual!'
      sign_in_and_redirect(user)
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    # handle you logic here..
    # and delegate to super.
    super
 end

  alias facebook all
  alias passthru all
  alias google_oauth2 all
end
