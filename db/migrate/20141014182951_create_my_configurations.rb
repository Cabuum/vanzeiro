class CreateMyConfigurations < ActiveRecord::Migration
  def change
    create_table :my_configurations do |t|
      t.integer :business_day_for_payments
      t.references :user, index: true
      t.integer :start_school_year, precision: 2
      t.integer :end_school_year, precision: 2
      t.decimal :default_value, precision: 10, scale: 2
      t.decimal :default_interest, precision: 10, scale: 2

      t.timestamps
    end
  end
end
