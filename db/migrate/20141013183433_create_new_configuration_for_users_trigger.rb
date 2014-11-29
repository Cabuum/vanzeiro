class CreateNewConfigurationForUsersTrigger < ActiveRecord::Migration
  def self.up
    execute 'DROP TRIGGER IF EXISTS config_after_new_user;'

    sql = <<-SQL
      CREATE TRIGGER config_after_new_user AFTER INSERT ON users
      FOR EACH ROW
      BEGIN
        INSERT INTO my_configurations (user_id, business_day_for_payments, created_at,
                  updated_at, start_school_year, end_school_year, default_value, default_interest)
          VALUES (NEW.id, 4, NOW(), NOW(), 1, 12, 100.00, 00.25);
      END
    SQL

    execute sql
  end
end