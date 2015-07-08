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
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'forward')
  }
  on joystick, :button_square => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'left')
  }
  on joystick, :button_circle => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'right')
  }
  on joystick, :button_x => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'back')
  }
  on joystick, :button_up => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'test')
  }
  on joystick, :button_down => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'test')
  }
  on joystick, :button_left => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'test')
  }
  on joystick, :button_right => proc { |*value|
    res = http.post_form(uri, 'sessionId' => id, 'command' => 'test')
  }
end
