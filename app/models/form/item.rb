class Form::Item < Item
  REGISTABLE_ATTRIBUTES = %i{ registar code item price }
  attr_accessor :registar
end