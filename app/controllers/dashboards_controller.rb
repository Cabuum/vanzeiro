class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @TotalPassengers = Passenger.count(:all)
    @movements = Movement.default current_user.id
    p @movements.count
  end
end