class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  def show; end

  def edit; end

  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    @bank.save

    respond_with(@bank, location: banks_path)
  end

  def update
    @bank.update(bank_params)

    respond_with(@bank, location: banks_path)
  end

  def destroy
    @bank.destroy

    respond_with(@bank, location: banks_path)
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:full_name, :name)
  end
end
