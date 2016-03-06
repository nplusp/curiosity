class Field
  attr_accessor :x, :y, :rovers

  def initialize(x: 5, y: 5)
    validate_size(x, y)
    @x = Integer(x)
    @y = Integer(y)
    @rovers = []
  end

  def add_rover(rover)
    validate_rover_position(rover.x, rover.y)
    @rovers << rover
  end

  private

  def validate_size(x, y)
    raise ArgumentError.new("Field sizes should greater than zero") unless x > 0 || y > 0
  end

  def validate_rover_position(x, y)
    raise ArgumentError.new("Invalid rover position") unless (1..@x) === x && (1..@y) === y
  end
end
