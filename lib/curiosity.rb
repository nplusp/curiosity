require 'validations/curiosity_validations'
require 'concerns/curiosity_movements'
require 'field'

class Curiosity
  include CuriosityValidations
  include CuriosityMovements

  DIRECTIONS = ["N", "E", "S", "W"]
  MOVEMENTS = ["L", "R", "M"]

  attr_accessor :x, :y, :facing, :field

  def initialize(x: 1, y: 1, facing: "N", field: Field.new)
    @x = Integer(x)
    @y = Integer(y)
    @facing = facing
    @field = field
    @field.add_rover self

    validate_position
    validate_facing
  end

  def execute_command(cmd)
    String(cmd).each_char { |char| execute(char) }
  end

  def position
    "x: #{@x}, y: #{@y}, facing: #{@facing}"
  end

  private

  def execute(char)
    validate_command(char)

    case char
    when "R" then turn(right: true)
    when "L" then turn(right: false)
    when "M" then move
    end
  end
end
