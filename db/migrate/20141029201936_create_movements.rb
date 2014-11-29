class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.references :movement_category, index: true
      t.references :user, index: true

      t.string :description, limit: 255
      t.string :from_of, limit: 100
      t.decimal :value, precision: 10, scale: 2
      t.boolean :paid, default: false
      t.date :expiration

      t.timestamps
    end
  end
end
