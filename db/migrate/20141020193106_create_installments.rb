class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.references :contract, index: true
      t.date :due_date
      t.boolean :paid, default: true
      t.date :payment_date

      t.timestamps
    end
  end
end
