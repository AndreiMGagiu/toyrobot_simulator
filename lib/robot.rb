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
    @position_x = 0
    @position_y = 0
    @heading = 0
    @placed = false
  end

  def place(x, y, h)
    raise 'Invalid placement: Out of boundaries' if x < 0 || x > MAX_X

    raise 'Invalid placement: Out of boundaries' if y < 0 || y > MAX_Y

    @position_x = x
    @position_y = y

    @heading = DIRECTIONS[h.upcase]
    @placed = true
  end

  def move
    return false unless @placed

    case @heading
    when DIRECTIONS # west
      raise 'Invalid Move: Out of boundaries' if @position_x.zero?

      @position_x -= 1
    when 1 # NORTH
      raise 'Invalid Move: Out of boundaries' if @position_y == MAX_Y

      @position_y += 1
    when 2 # EAST
      raise 'Invalid Move: Out of boundaries' if @position_x == MAX_X

      @position_x += 1
    when 3 # SOUTH
      raise 'Invalid Move: Out of boundaries' if @position_y.zero?

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

  def jump
    return false unless @placed

    case @heading
    when DIRECTIONS # west
      raise 'Invalid Move: Out of boundaries' if @position_x < 0

      @position_x -= 2
    when 1 # NORTH
      raise 'Invalid Move: Out of boundaries' if @position_y > MAX_Y - 2

      @position_y += 2
    when 2 # EAST
      raise 'Invalid Move: Out of boundaries' if @position_x > MAX_X - 2

      @position_x += 2
    when 3 # SOUTH
      raise 'Invalid Move: Out of boundaries' if @position_y < MAX_Y - 2

      @position_y -= 2
    end
    true
  end
end
