class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.string :description
      t.text :full_description
      t.boolean :clause, default: false
      t.boolean :clause2, default: false
      t.boolean :clause3, default: false
      t.boolean :clause4, default: false
      t.boolean :selected, default: false

      t.timestamps
    end
  end
end
