module GlobalizationHelper
  def model_name(model, count = 1)
    model.model_name.human(count: count)
  end

  def model_name_pluralized(model)
    model_name(model, 2)
  end

  def model_attribute(model, attribute, count = 1)
    model.human_attribute_name(attribute, count: count)
  end

  def model_attribute_show(model, attribute, count = 1)
    "#{model.human_attribute_name(attribute, count: count)}: "
  end

  alias tm model_name
  alias tmp model_name_pluralized
  alias ta model_attribute
  alias tas model_attribute_show
end
