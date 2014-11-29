class CreateSpectators < ActiveRecord::Migration
  def change
    create_table :spectators do |t|
      t.string :mail, limit: 80
      t.string :phone, limit: 15

      t.timestamps
    end
  end
end
