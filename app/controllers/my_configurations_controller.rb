class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def new
    @setting = Setting.new
  end

  def update
    if @setting.update(setting_params)
      redirect_to root_path, notice: t('my-configurations.update.success')
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_setting
    @setting = Setting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def setting_params
    params.require(:setting).permit(:business_day_for_payments, :default_value, :user_id,
                                             :default_interest)
  end
end
