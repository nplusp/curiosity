module FieldValidations
  private

  def validate_rover_initial_position(x, y)
    raise ArgumentError.new("Invalid rover position") unless (1..@x) === x && (1..@y) === y
  end

  def validate_size(x, y)
    raise ArgumentError.new("Field sizes should greater than zero") unless x > 0 || y > 0
  end
end
