class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  private
  def index_methods
    @passengers = Passenger.where(user_id: current_user.id).count

    @movements = Movement.default current_user.id
    p @movements.count
  end
end