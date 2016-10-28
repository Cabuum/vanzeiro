class HomeController < ApplicationController
  def index
    @newsletter = Newsletter.new
    redirect_to controller: :dashboards, action: :index unless current_user.nil?
  end

  def plan
    @plans = Plan.all
    @newsletter = Newsletter.new
  end

  def contact
    @contact = Contact.new
  end

  def send_contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Entraremos em contato em breve!'
      redirect_to contact_path
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to contact_path
    end
  end
end
