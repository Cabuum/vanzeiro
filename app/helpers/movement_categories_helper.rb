# frozen_string_literal: true
module MovementCategoriesHelper
  def to_readable_type(type)
    type == 1 ? 'Receitas' : 'Despesas'
  end
end
