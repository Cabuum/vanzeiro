class SpectatorController < ApplicationController
  def create
    @spectator = Spectator.new(spectator_params)
    if @spectator.save
      redirect_to root_path, notice: t('spectators.create.success')
    else
      render 'home/index'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def spectator_params
    params.require(:spectator).permit(:mail, :phone)
  end
end
