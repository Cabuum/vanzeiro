# frozen_string_literal: true
json.extract! @passenger, :id, :passenger_name, :passenger_email, :passenger_phone, :passenger_cpf,
              :passenger_address, :responsible_name, :responsible_email, :responsible_cpf, :responsible_phone
