module ContractsHelper
  def to_last_month(contract)
    "#{to_month_name contract.closing_date}/#{contract.closing_date.strftime('%y')}"
  end

  def to_month_name(month)
    (I18n.l month, format: '%B', locale: :pt).downcase
  end

  def to_contract_number(number)
    number_with_delimiter((sprintf '%010d', number), delimiter: '.')
  end
end
