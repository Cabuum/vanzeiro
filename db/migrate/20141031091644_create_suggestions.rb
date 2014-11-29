class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :description
      t.string :title
      t.string :email

      t.timestamps
    end
  end
end
