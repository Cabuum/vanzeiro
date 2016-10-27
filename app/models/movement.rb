class Movement < ActiveRecord::Base
  before_save :negative_costs
  before_update :negative_costs

  self.inheritance_column = nil

  scope :current_month, -> { where('EXTRACT(MONTH FROM expiration) = ?', Time.now.month) }

  scope :by_user, -> (user_id) { where(user_id: user_id) }

  # Method to get only incomes and sum by current month.
  scope :incoming, -> (user_id) { default(user_id).where(type: MovementCategory::INCOME) }

  # Method to get only costs and sum by current month.
  scope :costs, -> (user_id) { default(user_id).where(type: MovementCategory::COSTS) }

  def self.total(user_id)
    Movement.costs(user_id).sum(:value).to_f + Movement.incoming(user_id).sum(:value).to_f
  end

  def negative_costs
    self.value = value * -1 if (type == MovementCategory::COSTS) && value > 0
  end
end
