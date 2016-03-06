module CuriosityValidations
  def validate_rover_movement
    raise ArgumentError.new("Invalid rover movement") unless (1..@field.x) === @x && (1..@field.y) === @y
  end

  private

  def validate_command(char)
    raise ArgumentError.new("Invalid movement command") unless Curiosity::MOVEMENTS.include? char
  end

  def validate_position
    raise ArgumentError.new("Invalid position") if @x < 0 || @y < 0
  end

  def validate_facing
    raise ArgumentError.new("Invalid facing") unless Curiosity::DIRECTIONS.include? @facing
  end
end
