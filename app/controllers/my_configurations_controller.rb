class MyConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_configuration, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def new
    @my_configuration = MyConfiguration.new
  end

  def update
    if @my_configuration.update(my_configuration_params)
      redirect_to eu_path, notice: t('my-configurations.update.success')
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_my_configuration
    @my_configuration = MyConfiguration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def my_configuration_params
    params.require(:my_configuration).permit(:business_day_for_payments, :default_value, :user_id,
                                             :default_interest)
  end
end
