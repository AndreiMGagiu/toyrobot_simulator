# frozen_string_literal: true

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

require 'spec_helper.rb'
require 'robot.rb'

describe Robot do
  it 'should change heading RIGHT properly' do
    r = Robot.new
    r.place(0, 0, 'WEST')
    expect(r.get_heading).to eq 'WEST'
    r.change_heading('RIGHT')
    expect(r.get_heading).to eq 'NORTH'
    r.change_heading('RIGHT')
    expect(r.get_heading).to eq 'EAST'
    r.change_heading('RIGHT')
    expect(r.get_heading).to eq 'SOUTH'
    r.change_heading('RIGHT')
    expect(r.get_heading).to eq 'WEST'
  end

  it 'should change heading LEFT properly' do
    r = Robot.new
    r.place(0, 0, 'SOUTH')
    expect(r.get_heading).to eq 'SOUTH'
    r.change_heading('LEFT')
    expect(r.get_heading).to eq 'EAST'
    r.change_heading('LEFT')
    expect(r.get_heading).to eq 'NORTH'
    r.change_heading('LEFT')
    expect(r.get_heading).to eq 'WEST'
    r.change_heading('LEFT')
    expect(r.get_heading).to eq 'SOUTH'
  end

  it 'should move UP on the Y axis one unit facing NORTH correctly' do
    r = Robot.new
    r.place(1, 2, 'NORTH')
    r.move
    x, y = r.position
    expect(y).to eq 3
  end


  it 'should move RIGHT on the X axis one unit facing EAST correctly' do
    r = Robot.new
    r.place(0, 1, 'EAST')
    r.move
    x, y = r.position
    expect(x).to eq 1
  end

  it 'should move RIGHT on the X axis one unit facing WEST correctly' do
    r = Robot.new
    r.place(3, 0, 'WEST')
    r.move
    x, y = r.position
    expect(x).to eq 2
  end

  it 'should move EAST and then NORTH ' do
    r = Robot.new
    r.place(3, 0, 'WEST')
    r.move
    x, y = r.position
    expect(x).to eq 2
    r.change_heading('RIGHT')
    r.move
    x, y = r.position
    expect(x).to eq 2
    expect(y).to eq 1
    r.change_heading('RIGHT')
    r.move
    r.move
    x, y = r.position
    expect(x).to be 4
    expect(y).to eq 1
  end

  it 'should move RIGHT on the X axis one unit correctly' do
    r = Robot.new
    r.place(3, 0, 'WEST')
    r.move
    x, y = r.position
    expect(x).to eq 2
    r.move
    r.move
    expect { r.move }.to raise_error
  end

  describe '#position' do
    it 'places the robot in the position 0, 0' do
      expect(subject.position).to eq [0, 0]
    end
  end

  describe '#get_heading' do
    it 'should give the default heading of the robot WEST ' do
      expect(subject.get_heading).to eq 'WEST'
    end
  end
end
