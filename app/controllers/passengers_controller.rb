# frozen_string_literal: true
class PassengersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.where(user_id: current_user.id)
  end

  def new
    @passenger = Passenger.new
  end

  def show; end

  def create
    @passenger = Passenger.new(passenger_params)
    @passenger.user = current_user

    if @passenger.save
      redirect_to passengers_path, notice: t('passengers.create.success')
    else
      render :new
    end
  end

  def update
    if @passenger.update(passenger_params)
      redirect_to passengers_path, notice: t('passengers.update.success')
    else
      render :edit
    end
  end

  def destroy
    @passenger.destroy
    redirect_to passengers_url, notice: t('passengers.delete.success')
  end

  private

  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def passenger_params
    params.require(:passenger).permit(:responsible_cpf, :responsible_name, :responsible_phone,
                                      :responsible_email, :passenger_birthday, :passenger_cpf,
                                      :passenger_phone, :passenger_name, :passenger_email,
                                      :passenger_address, :contract_start, :contract_order)
  end
end
