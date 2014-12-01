class BilletController < ApplicationController
  before_action :authenticate_user!

  SUPPORTED_FORMATS = {
      :pdf => 'application/pdf',
      :jpg => 'image/jpg',
      :tif => 'image/tiff',
      :png => 'image/png'
  }

  # For installments :id => :installment_id
  # GET /billets/generate_billet/pdf/1
  def generate_billet
    installment = Installment.find params[:id]
    set_billet installment

    format = params[:format].to_sym
    headers['Content-Type'] = SUPPORTED_FORMATS[format]
    send_data @archive.to(format), :filename => "#{@archive.numero_documento}.#{format}"
  end

  # For contracts :id => :contract_id
  # GET /billets/generate_billet/pdf/1
  def multiple_billet
    contract = Contract.find params[:id]
    format = params[:format].to_sym

    billets = []
    contract.installments.each do |installment|
      billets << set_billet(installment)
    end

    send_data Brcobranca::Boleto::Base.lote(billets), filename: "contrato_n_#{contract.id}.#{format}"
  end

  private

  def set_billet(installment)
    @archive = case installment.contract.account.bank.name.to_sym
                 when :bb then Brcobranca::Boleto::BancoBrasil.new
                 else Brcobranca::Boleto::Caixa.new
               end

    @archive.cedente = current_user.name_to_billet
    @archive.documento_cedente = current_user.document
    @archive.sacado = installment.contract.passenger.name_to_billet
    @archive.sacado_documento = installment.contract.passenger.document_to_billet
    @archive.valor = installment.contract.value
    @archive.agencia = installment.contract.account.agency
    @archive.conta_corrente = installment.contract.account.account
    @archive.convenio = installment.contract.account.agreement
    @archive.numero_documento = sprintf '%010d', installment.id
    @archive.dias_vencimento = current_user.configuration.business_day_for_payments.business_days
    .after(Date.new Time.now.year, installment.due_date.month).to_date

    @archive.data_documento = Time.now.strftime('%d-%m-%Y').to_date
    @archive.instrucao1 = installment.contract.account.instruction1
    @archive.instrucao2 = installment.contract.account.instruction2
    @archive.instrucao3 = installment.contract.account.instruction3
    @archive.instrucao4 = installment.contract.account.instruction4
    @archive.instrucao5 = installment.contract.account.instruction5
    @archive.instrucao6 = installment.contract.account.instruction6
    @archive.instrucao7 = installment.contract.account.instruction7
    @archive.sacado_endereco = installment.contract.passenger.passenger_address

    p '------------------------------------------------------------------------------------------------------------------------------------'
    p @archive

    @archive
  end
end
