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
    @y = @y + 1 if @facing == 'N' && validate_y(@y + 1)
    @y = @y - 1 if @facing == 'S' && validate_y(@y - 1)
    @x = @x + 1 if @facing == 'E' && validate_x(@x + 1)
    @x = @x - 1 if @facing == 'W' && validate_x(@x - 1)
  end
end
