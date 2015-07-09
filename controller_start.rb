# This stuff uses artoo.io to connect to a USB PS3 controller
# And grab button events to send as commands.

# It's also really cool.

require 'artoo'
require 'net/http'

http = Net::HTTP

uri = URI('http://hbar.kapsi.fi/ccserver/mote/put/')
id = http.get('hbar.kapsi.fi','/ccserver/mote/newID/')

puts "Your session ID is: " + id
puts "Connect using \"moteplus <id>\" on your CC Turtle"

connection :joystick, :adaptor => :joystick
device :joystick, :driver => :ps3, :connection => :joystick, :interval => 0.1

work do
  on joystick, :button_triangle => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'up')
    puts 'triangle'
  }
  on joystick, :button_square => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'suck')
    puts 'square'
  }
  on joystick, :button_circle => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'drop')
    puts 'circle'
  }
  on joystick, :button_x => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'down')
    puts 'ex'
  }
  on joystick, :joystick => proc { |caller, value|
    if value[:s] == 0 then
      if value[:x] > 25000 then
        res = http.post_form(uri, 'sessionId' => id, 'command' => 'place')
        puts 'left stick right'
      elsif value[:x] < -25000 then
        puts 'left stick left'
      elsif value[:y] > 25000 then
        res = http.post_form(uri, 'sessionId' => id, 'command' => 'placeDown')
        puts 'left stick down'
      elsif value[:y] < -25000 then
        res = http.post_form(uri, 'sessionId' => id, 'command' => 'placeUp')
        puts 'left stick up'
      end
    elsif value[:s] == 1 then
      if value[:x] > 25000 then
        res = http.post_form(uri, 'sessionId' => id, 'command' => 'dig')
        puts 'right stick right'
      elsif value[:x] < -25000 then
        puts 'right stick left'
      elsif value[:y] > 25000 then
        res = http.post_form(uri, 'sessionId' => id, 'command' => 'digDown')
        puts 'right stick down'
      elsif value[:y] < -25000 then
        res = http.post_form(uri, 'sessionId' => id, 'command' => 'digUp')
        puts 'right stick up'
      end
    end
  }
  on joystick, :button => proc { |*value|
    if value[1] == 4 then
      res = http.post_form(uri, 'sessionId' => id, 'command' => 'forward')
      puts 'dpad up'
    elsif value[1] == 6 then
      res = http.post_form(uri, 'sessionId' => id, 'command' => 'back')
      puts 'dpad down'
    elsif value[1] == 7 then
      res = http.post_form(uri, 'sessionId' => id, 'command' => 'left')
      puts 'dpad left'
    elsif value[1] == 5 then
      res = http.post_form(uri, 'sessionId' => id, 'command' => 'right')
      puts 'dpad right'
    end
  }
  on joystick, :button_r1 => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'rs')
    puts 'button r1'
  }
end
