class InstallmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @installments = if params.key?(:contract_id)
                      Installment.where contract_id: params[:contract_id]
                    else
                      Installment.current_month
                    end
  end

  def update
    @installment = Installment.find(params[:id])
    @installment.paid = params[:paid]

    @installment.payment_date = (Time.now if @installment.paid)
    if @installment.save

      redirect_to passenger_contract_installments_path(@installment.contract.passenger.id,
                                                       @installment.contract.id),
                  notice: t('installments.update.success')
    else
      render :index
    end
  end
end
