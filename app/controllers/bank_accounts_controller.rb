class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]

  def show; end

  def index
    @bank_accounts = BankAccount.find_by(user_id: current_user.id)
  end

  def new
    @bank_account = BankAccount.new
    @banks = Bank.all
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to root_path, notice: t('bank_accounts.create.success')
    else
      render :new
    end
  end

  def update
    if @bank_account.update(bank_account_params)
      redirect_to root_path, notice: t('bank_accounts.update.success')
    else
      render :edit
    end
  end

  def destroy
    @bank_account.destroy
    redirect_to root_path, notice: t('bank_accounts.delete.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
    @banks = Bank.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bank_account_params
    params.require(:bank_account).permit(:user_id, :bank_id, :agency, :account, :agreement, :name,
                                          :instruction1, :instruction2, :instruction3, :instruction7,
                                          :instruction4, :instruction5, :instruction6, :nick)
  end
end
