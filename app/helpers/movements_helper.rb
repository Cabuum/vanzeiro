module MovementsHelper
  def to_readable_paid(paid)
    paid ? 'Sim' : 'Não'
  end
end
