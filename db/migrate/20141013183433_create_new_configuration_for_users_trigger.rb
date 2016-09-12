class CreateNewConfigurationForUsersTrigger < ActiveRecord::Migration
  def self.up
    execute 'DROP TRIGGER IF EXISTS config_after_new_user ON users;'

    sql = <<-SQL
      CREATE OR REPLACE FUNCTION add_new_config() 
      RETURNS TRIGGER LANGUAGE plpgsql
      AS
        '
        BEGIN 
          INSERT INTO my_configurations (user_id, business_day_for_payments, start_school_year, end_school_year, default_value, default_interest)
            VALUES (NEW.id, 4, 1, 12, 100.00, 00.25);
          RETURN NEW;
        END; 
        ';

      CREATE TRIGGER config_after_new_user
        AFTER INSERT ON users
        FOR EACH ROW
        EXECUTE PROCEDURE add_new_config();
    SQL

    execute sql
  end
end