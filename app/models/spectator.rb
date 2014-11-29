class Spectator < ActiveRecord::Base

  validate :has_a_contact

  def has_a_contact
    if mail?
      validates_format_of :mail, with: EMAIL_REGEXP
    elsif !phone?
      errors.add :base, t('spectators.create.error.without-contact')
    end
  end

  private

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
