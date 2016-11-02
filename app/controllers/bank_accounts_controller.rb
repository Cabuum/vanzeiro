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
    @bank_account.save

    respond_with(@bank_account, location: root_path)
  end

  def update
    @bank_account.update(bank_account_params)

    respond_with(@bank_account, location: root_path)
  end

  def destroy
    @bank_account.destroy

    respond_with(@bank_account, location: root_path)
  end

  private

  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
    @banks = Bank.all
  end

  def bank_account_params
    params.require(:bank_account)
      .permit(:user_id, :bank_id, :agency, :account, :agreement, :name,
       :instruction1, :instruction2, :instruction3, :instruction7,
        :instruction4, :instruction5, :instruction6, :nick)
  end
end
