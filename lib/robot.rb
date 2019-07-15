# frozen_string_literal: true

class Robot # :nodoc:
  MAX_X = 4
  MAX_Y = 4
  DIRECTIONS = {
    'WEST' => 0,
    'NORTH' => 1,
    'EAST' => 2,
    'SOUTH' => 3
  }.freeze

  def initialize
    # 0 = West ,1 = North , 2 = East, 3 = South
    @position_x = 0
    @position_y = 0
    @heading = 0
    @placed = false
  end

  def place(x, y, h)
    @position_x = x
    @position_y = y

    @heading = DIRECTIONS[h.upcase]
    @placed = true
  end

  def move
    return false unless @placed

    case @heading
    when 0 # west
      raise 'Invalid Move' if @position_x.zero?

      @position_x -= 1
    when 1 # NORTH
      raise 'Invalid Move' if @position_y == MAX_Y

      @position_y += 1
    when 2 # EAST
      raise 'Invalid Move' if @position_x == MAX_X

      @position_x += 1
    when 3 # SOUTH
      raise 'Invalid Move' if @position_y.zero?

      @position_y -= 1
    end
    true
  end

  def change_heading(direction)
    return false unless @placed

    if direction == 'LEFT'
      @heading -= 1
      @heading = 3 if @heading == -1
    elsif direction == 'RIGHT'
      @heading += 1
      @heading = 0 if @heading == 4
    end
    true
  end

  def get_heading
    DIRECTIONS.invert[@heading]
  end

  def position
    [@position_x, @position_y]
  end
end
