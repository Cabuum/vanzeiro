Brcobranca::Boleto::Base.class_eval do
  # Data de vencimento baseado na <b>data_documento + dias_vencimento</b>
  #
  # @return [Date]
  # @raise [ArgumentError] Caso {#data_documento} esteja em branco.
  def data_vencimento
    return dias_vencimento
  end
end