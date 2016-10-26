class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
	index_methods
  end

  private
  
  def index_methods
    @passengers = Passenger.where(user_id: current_user.id).count
    @movements = Movement.current_month.by_user(current_user.id)
  end
end