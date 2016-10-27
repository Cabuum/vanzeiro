# frozen_string_literal: true
class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :passenger
  belongs_to :account
  has_many :installments, dependent: :destroy

  # To retrieve only the active contracts
  scope :active, -> { where(is_alive: true) }

  validate :in_range

  def in_range
    times = (start.to_date..closing_date.to_date).select { |d| d.day == 1 }.count
    if times > 6
      errors.add :base, I18n.translate('contracts.create.error.out-range')
    end
  end

  def until_the_end
    many = (start.to_date..closing_date.to_date).select { |d| d.day == 1 }.count
    value = many - (closing_date.month - Time.now.month)
    to_hash = (10 - value) * 10
    case value
    when 1, 2, 3 # quase
      { css: 'success', value: to_hash }
    when 4, 5, 6 # comecinho
      { css: 'warning', value: to_hash }
    else
      { css: 'danger', value: to_hash }
    end
  end

  def generate_installments
    range = (start.to_date..closing_date.to_date).select { |d| d.day == 1 }

    range.each do |date|
      due_date = user.configuration.business_day_for_payments.business_days
                     .after(Date.new(Time.now.year, date.month)).to_date

      i = Installment.new contract_id: id, due_date: due_date, paid: false
      i.save
    end
  end
end
