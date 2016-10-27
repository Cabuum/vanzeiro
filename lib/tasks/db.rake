# frozen_string_literal: true
namespace :db do
  desc 'This rake task insert a new configuration in every user without a configuration.'
  task everyone_with_configuration: :environment do
    ActiveRecord::Base.connection
                      .execute 'INSERT configurations (user_id)
        SELECT id FROM users WHERE
          id NOT IN (SELECT user_id FROM configurations);'
  end
end
