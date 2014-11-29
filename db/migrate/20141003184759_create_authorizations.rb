class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider, limit: 20
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret
      t.string :username, limit: 40

      t.timestamps
    end
  end
end