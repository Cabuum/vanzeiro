json.array!(@installments) do |installment|
  json.name installment.contract.passenger.passenger_name
  json.paid installment.paid ? 'Sim' : 'Não'
  json.expiration installment.due_date.strftime('%d/%m/%Y')
  json.value number_to_currency installment.contract.value
end
