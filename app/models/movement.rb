class Movement < ActiveRecord::Base
  before_save :negative_costs
  before_update :negative_costs

  self.inheritance_column = nil

  scope :default, -> (user_id) { where("MONTH(`movements`.expiration) =
                                       #{Time.now.month} AND `movements`.user_id = #{user_id}") }

  # Method to get only incomes and sum by current month.
  scope :incoming, -> (user_id) { default(user_id).where(type: MovementCategory::INCOME) }

  # Method to get only costs and sum by current month.
  scope :costs, -> (user_id) { default(user_id).where(type: MovementCategory::COSTS) }

  def self.total(user_id)
    Movement.costs(user_id).sum(:value).to_f + Movement.incoming(user_id).sum(:value).to_f
  end

  def negative_costs
    self.value = self.value * -1 if self.type == MovementCategory::COSTS and self.value > 0
  end
end