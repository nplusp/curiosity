module CuriosityMovements
  private

  def turn(right: false)
    index = Curiosity::DIRECTIONS.index(@facing)
    index = 0 if index == -4
    index = -1 if index == 3
    index = right ? index + 1 : index - 1

    @facing = Curiosity::DIRECTIONS[index]
  end

  def move
    @y = @y + 1 if @facing == 'N'
    @y = @y - 1 if @facing == 'S'
    @x = @x + 1 if @facing == 'E'
    @x = @x - 1 if @facing == 'W'

    # validate_rover_movement
  end
end
