class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: [:show, :destroy]

  def index
    @contracts = if params.has_key?(:passenger_id)
                   Contract.where(passenger_id: params[:passenger_id])
                 else
                   Contract.where(user_id: current_user.id)
                 end
  end

  def show; end

  def new
    @contract = Contract.new
    get_initial_options
  end

  def create
    @contract = Contract.new contract_params

    respond_to do |format|

      if @contract.save

        @contract.generate_installments
        format.response { redirect_to controller: :billet, action: :multiple_billet, id: @contract.id, format: :pdf }
        format.html { redirect_to contracts_path }
        # TODO: fazer com que quando gere o boleto ele volte MESMO pra cá;
      else
        get_initial_options
        format.html { render :new }
      end
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_url, notice: t('contracts.delete.success')
  end

  private
  def get_initial_options
    @passengers = Passenger.where user_id: current_user.id
    @accounts = Account.where user_id: current_user.id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contract
    @contract = Contract.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contract_params
    params.require(:contract).permit(:value, :passenger_id, :account_id, :interest, :start, :user_id, :closing_date)
  end
end
