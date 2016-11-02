class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def new
    @setting = Setting.new
  end

  def update
    @setting.update(setting_params)

    respond_with(@setting, location: root_path)
  end

  private

  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:business_day_for_payments, :default_value,
                                    :user_id, :default_interest)
  end
end
