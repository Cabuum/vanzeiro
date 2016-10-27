# frozen_string_literal: true
class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def show; end

  def index
    @accounts = Account.find_by(user_id: current_user.id)
  end

  def new
    @account = Account.new
    @banks = Bank.all
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to eu_path, notice: t('accounts.create.success')
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to eu_path, notice: t('accounts.update.success')
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to eu_path, notice: t('accounts.delete.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
    @banks = Bank.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:user_id, :bank_id, :agency, :account, :agreement, :name,
                                    :instruction1, :instruction2, :instruction3, :instruction7,
                                    :instruction4, :instruction5, :instruction6, :nick)
  end
end
