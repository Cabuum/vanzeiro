class RenameAccountToBankAccountField < ActiveRecord::Migration
  def change
    rename_column :contracts, :account_id, :bank_account_id
  end
end
