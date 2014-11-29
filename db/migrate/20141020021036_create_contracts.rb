class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :user, index: true
      t.references :passenger, index: true
      t.references :account, index: true
      t.decimal :interest, precision: 5, scale: 2
      t.date :start
      t.date :closing_date
      t.decimal :value, precision: 10, scale: 2
      t.boolean :is_alive

      t.timestamps
    end
  end
end
