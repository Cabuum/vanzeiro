class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :full_name, limit: 30
      t.string :name, limit: 10

      t.timestamps
    end
  end
end
