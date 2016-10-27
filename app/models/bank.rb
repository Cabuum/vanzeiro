# frozen_string_literal: true
class Bank < ActiveRecord::Base
  belongs_to :account
end
