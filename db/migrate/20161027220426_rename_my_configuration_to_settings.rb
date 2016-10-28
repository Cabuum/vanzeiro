class RenameMyConfigurationToSettings < ActiveRecord::Migration
  def change
    rename_table :my_configurations, :settings
  end
end
