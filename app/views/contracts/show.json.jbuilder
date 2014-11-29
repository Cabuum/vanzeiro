json.extract! @contract, :id, :interest, :start, :closing_date
json.value number_to_currency @contract.value
json.time distance_of_time_in_words(@contract.start, @contract.closing_date)
json.bank @contract.account.bank.full_name
json.passenger_name @contract.passenger.passenger_name
