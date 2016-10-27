# frozen_string_literal: true
json.extract! @movement, :id, :description, :from_of,
              :value, :paid, :expiration, :created_at, :updated_at
