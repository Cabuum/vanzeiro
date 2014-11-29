class Passenger < ActiveRecord::Base
  belongs_to :user
  has_many :contracts, dependent: :destroy

  # This method verify if the passenger is of age!
  def is_of_age?
    Time.now.years_ago(passenger_birthday.year).year > 18
  end

  # These methods only will be used in printing a archive.
  def name_to_billet
    is_of_age? ? passenger_name : "#{responsible_name} (#{passenger_name})"
  end

  def document_to_billet
    is_of_age? ? passenger_cpf : responsible_cpf
  end

  def last_contract
      contracts.order('contracts.closing_date DESC').first
  end
end
