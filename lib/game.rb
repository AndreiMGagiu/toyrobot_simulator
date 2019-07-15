# frozen_string_literal: true

require './robot.rb'

# Visual representation of the table
# grid = [
#   %w[x x x x x],
#   %w[x x x x x],
#   %w[x x x x x],
#   %w[x x x x x],
#   %w[x x x x x]
# ]

robot = Robot.new

while (input = gets)
  input = input.chomp
  # PLACE 0,1
  command = input.split(' ')[0]

  case command.downcase
  when 'place'
    data = input.split(' ')[1]
    x, y, direction = data.split(',')
    robot.place(x.to_i, y.to_i, direction)

  when 'move'
    begin
      unless robot.move
      end
    rescue StandardError
    end
  when 'left'
    robot.change_heading('LEFT')
  when 'right'
    robot.change_heading('RIGHT')
  when 'report'
    puts "POSITION : #{robot.position} HEADING: #{robot.get_heading}"
  end
end
