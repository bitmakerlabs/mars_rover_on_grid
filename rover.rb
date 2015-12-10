# NOTE - although these classes are separated, the grid does not currently handle the possibility
# of more than one rover on the same grid
#
# Consider that scenario and think about how it could be done. HINT - which class (if any) should 
# be responsible for detecting collisions on a given grid?

class Grid
  
  attr_accessor :size_x, :size_y

  # Set default size to be 10 x 10
  def initialize
    @size_x = 10
    @size_y = 10
  end

end 

class Rover

  attr_accessor :pos_x, :pos_y, :facing

  def initialize(grid, pos_x, pos_y, facing)
    @grid = grid
    @pos_x = pos_x
    @pos_y = pos_y
    @facing = facing
  end

  def move
    case @facing
    when "N"
      @pos_y += 1 unless @grid.size_y < @pos_y + 1
    when "E"
      @pos_x += 1 unless @grid.size_x < @pos_x + 1
    when "S"
      @pos_y -= 1 unless @pos_y - 1 < 1
    when "W"
      @pos_x -= 1 unless @pos_x - 1 < 1
    end
  end

  def turn(new_direction)
    case new_direction
    when "L"
      @facing = "W" if @facing == "N"
      @facing = "N" if @facing == "E"
      @facing = "E" if @facing == "S"
      @facing = "S" if @facing == "W"
    when "R"
      @facing = "E" if @facing == "N"
      @facing = "S" if @facing == "E"
      @facing = "W" if @facing == "S"
      @facing = "N" if @facing == "W"
    end
  end

  def print_position
    puts "Current position is #{@pos_x}, #{@pos_y} facing #{@facing}"
  end

end

grid = Grid.new
rover = Rover.new(grid, 9, 9, "N")
rover.print_position
rover.move
rover.print_position
rover.move
rover.print_position

