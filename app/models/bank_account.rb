class BankAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :bank
  has_many :contracts, dependent: :destroy

  # self.table_name = 'bank_accounts'
end
