class Curiosity
  attr_accessor :x, :y, :facing

  def initialize(x: 1, y: 1, facing: 'N')
    @x = Integer(x)
    @y = Integer(y)
    validate_facing(facing)
    @facing = facing
  end

  private

  def validate_facing(facing = @facing)
    raise ArgumentError.new("Invalid facing") unless ["N", "E", "S", "W"].include? facing
  end
end
