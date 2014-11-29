class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|

      t.references :user, index: true
      t.string :responsible_cpf, limit: 14
      t.string :responsible_name, limit: 40
      t.string :responsible_phone, limit: 15
      t.string :responsible_email, limit: 60
      t.date :passenger_birthday
      t.string :passenger_cpf, limit: 14
      t.string :passenger_phone, limit: 15
      t.string :passenger_name, limit: 40
      t.string :passenger_email, limit: 60
      t.string :passenger_address

      t.timestamps
    end
  end
end
