class AddTypeToMovements < ActiveRecord::Migration
  def change
    add_column :movements, :type, :integer
    remove_column :movements, :movement_category_id
  end
end
