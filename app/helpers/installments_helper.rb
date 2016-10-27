module InstallmentsHelper
  def due_date_formatted(due_date)
    (I18n.l due_date, format: '%d/%B/%y', locale: :pt).downcase
  end
end
