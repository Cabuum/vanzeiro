# frozen_string_literal: true
class MovementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movement, only: [:edit, :update, :destroy]

  def index
    @movements = Movement.current_month.by_user(current_user.id)
  end

  def new
    @movement = Movement.new
  end

  def show
    set_movement
  end

  def edit; end

  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      redirect_to movements_path, notice: t('movements.create.success')
    else
      render :new
    end
  end

  def update
    if @movement.update(movement_params)
      redirect_to movements_path, notice: t('movements.update.success')
    else
      render :edit
    end
  end

  def destroy
    @movement.destroy
    redirect_to movements_url, notice: t('movements.delete.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movement
    @movement = Movement.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movement_params
    params.require(:movement).permit(:description, :type, :from_of, :value, :paid, :expiration, :user_id)
  end
end
