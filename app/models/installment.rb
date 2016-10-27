# frozen_string_literal: true
class Installment < ActiveRecord::Base
  belongs_to :contract

  # Retrieves only the installments that will be due in this month
  scope :current_month, -> { where('MONTH(`installments`.due_date) = ?', Time.now.month) }
end
