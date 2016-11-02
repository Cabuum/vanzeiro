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

    if @bank.save
      redirect_to :index, notice: t('banks.create.success')
    else
      render :new
    end
  end

  def update
    if @bank.update(bank_params)
      redirect_to :index, notice: t('banks.update.success')
    else
      render :edit
    end
  end

  def destroy
    @bank.destroy
    redirect_to support_banks_url, notice: t('banks.delete.success')
  end

  private


  def set_bank
    @bank = Bank.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bank_params
    params.require(:bank).permit(:full_name, :name)
  end
end
