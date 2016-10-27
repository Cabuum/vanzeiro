# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :redirect_subdomain

  def redirect_subdomain
    if request.host == 'www.vanzeiro.com'
      redirect_to 'http://vanzeiro.com' + request.fullpath
    end
  end
end
