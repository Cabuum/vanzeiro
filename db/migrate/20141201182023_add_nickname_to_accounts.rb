class AddNicknameToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :nick, :string, limit: 30
  end
end
