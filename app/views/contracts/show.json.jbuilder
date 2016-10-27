# frozen_string_literal: true
json.extract! @contract, :id, :interest
json.value number_to_currency @contract.value
json.start @contract.start.strftime('%d/%m/%y')
json.closing_date @contract.closing_date.strftime('%d/%m/%y')
json.time distance_of_time_in_words(@contract.start, @contract.closing_date)
json.bank @contract.account.bank.full_name
json.passenger_name @contract.passenger.passenger_name
