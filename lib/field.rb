require 'validations/field_validations'

class Field
  include FieldValidations

  attr_accessor :x, :y, :rovers

  def initialize(x: 5, y: 5)
    validate_size(x, y)
    @x = Integer(x)
    @y = Integer(y)
    @rovers = []
  end

  def add_rover(rover)
    validate_rover_initial_position(rover.x, rover.y)
    @rovers << rover
  end
end
