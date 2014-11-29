class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @TotalPassengers = Passenger.count(:all)
  end
end