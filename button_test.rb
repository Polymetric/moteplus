# Run this to shoot post requests to the hbar.kapsi.fi server and test your commands.

require 'net/http'
http = Net::HTTP

uri = URI('http://hbar.kapsi.fi/ccserver/mote/put/')
id = http.get('hbar.kapsi.fi','/ccserver/mote/newID/')

puts "Your session ID is: " + id
puts "Connect using \"moteplus <id>\" on your CC Turtle"
puts "Commands are:"
puts "forward, back"
puts "left, right"
puts "up, down"
puts "dig, digDown, digUp"
puts "place, placeDown, placeUp"
puts "rs, rsBack, rsUp, rsDown, rsLeft, rsRight"

while true
  command = gets
  res = http.post_form(uri, 'sessionId' => id, 'command' => command.to_s)
  if res.message == "OK" then
    puts 'Command: ' + command + ' sent!'
  else
    puts 'Error sending command, please restart'
  end
end
