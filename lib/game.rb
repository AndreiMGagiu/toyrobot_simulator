# frozen_string_literal: true

require './robot.rb'

# Visual representation of the table
# Sample 5x5:
# 0,4  1,4  2,4  3,4  4,4
# 0,3  1,3  2,3  3,3  4,3
# 0,2  1,2  2,2  3,2  4,2
# 0,1  1,1  2,1  3,1  4,1
# 0,0  1,0  2,0  3,0  4,0

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
    rescue StandardError => e
      puts "Error occured: #{e}"
    end
  when 'left'
    robot.change_heading('LEFT')
  when 'right'
    robot.change_heading('RIGHT')
  when 'report'
    puts "POSITION : #{robot.position} HEADING: #{robot.get_heading}"
  when 'jump'
    begin
      robot.jump
  rescue StandardError => e
    puts "Error ocurred: #{e}"
    end
  end
end
