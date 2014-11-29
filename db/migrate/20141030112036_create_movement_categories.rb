class CreateMovementCategories < ActiveRecord::Migration
  def change
    create_table :movement_categories do |t|
      t.references :user, index: true

      t.string :name, limit: 40
      t.integer :type, precision: 2

      t.timestamps
    end
  end
end
