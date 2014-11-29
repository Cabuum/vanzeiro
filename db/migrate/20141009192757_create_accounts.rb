class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|

      t.references :user, index: true
      t.references :bank, index: true

      t.string :agency
      t.string :account
      t.string :agreement
      t.string :instruction1
      t.string :instruction2
      t.string :instruction3
      t.string :instruction4
      t.string :instruction5
      t.string :instruction6
      t.string :instruction7

      t.timestamps
    end
  end
end
