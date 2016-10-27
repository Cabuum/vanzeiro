# frozen_string_literal: true
class MovementCategory < ActiveRecord::Base
  # Constants to don't forgive the values of type attr.
  COSTS = 2
  INCOME = 1

  # Say to ActiveRecord that there are no column be inherited on another model,
  # because the :type attr, is a keyword.
  self.inheritance_column = nil
  # has_many :movements, dependent: :destroy

  validates :type, :name, presence: true
end
