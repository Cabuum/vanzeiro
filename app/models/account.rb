    class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :bank

  self.table_name = '`accounts`'
end
