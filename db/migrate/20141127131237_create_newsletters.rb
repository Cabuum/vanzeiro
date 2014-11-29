class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :mail, unique: true
      t.boolean :skills, default: true
      t.boolean :discounts, default: true

      t.timestamps
    end
  end
end
