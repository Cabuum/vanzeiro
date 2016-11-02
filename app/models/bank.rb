class Bank < ActiveRecord::Base
  has_many :accounts, class_name: 'BankAccount'
end
