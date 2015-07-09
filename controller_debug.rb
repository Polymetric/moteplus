require 'artoo'

connection :joystick, :adaptor => :joystick
device :joystick, :driver => :ps3, :connection => :joystick, :interval => 0.1

work do
  on joystick, :button_triangle => proc { |*value|
    puts 'triangle'
  }
  on joystick, :button_square => proc { |*value|
    puts 'square'
  }
  on joystick, :button_circle => proc { |*value|
    puts 'circle'
  }
  on joystick, :button_x => proc { |*value|
    puts 'ex'
  }
  on joystick, :joystick => proc { |caller, value|
    if value[:s] == 0 then
      if value[:x] > 25000 then
        puts 'left stick right'
      elsif value[:x] < -25000 then
        puts 'left stick left'
      elsif value[:y] > 25000 then
        puts 'left stick down'
      elsif value[:y] < -25000 then
        puts 'left stick up'
      end
    elsif value[:s] == 1 then
      if value[:x] > 25000 then
        puts 'right stick right'
      elsif value[:x] < -25000 then
        puts 'right stick left'
      elsif value[:y] > 25000 then
        puts 'right stick down'
      elsif value[:y] < -25000 then
        puts 'right stick up'
      end
    end
  }
  on joystick, :button => proc { |*value|
    if value[1] == 4 then
      puts 'dpad up'
    elsif value[1] == 6 then
      puts 'dpad down'
    elsif value[1] == 7 then
      puts 'dpad left'
    elsif value[1] == 5 then
      puts 'dpad right'
    end
  }
end
