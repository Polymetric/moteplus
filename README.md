# moteplus
A fork of http://hbar.kapsi.fi/ccserver/mote/ that adds more functionality.

Controller support for USB PS3 controller via artoo requires ruby and the artoo gem. Run `ruby controller_start.rb` to start that up. Program will output the session id to plug into the client.

Redstone output, more dig directions, etc.

Current client pastebin is:
http://pastebin.com/Gdm1z8Gv

## Controller Bindings
| button            	| command                     	|
|-------------------	|-----------------------------	|
| square            	| suck                        	|
| circle            	| drop                        	|
| triangle          	| up                          	|
| x                 	| down                        	|
| dpad up           	| forward                     	|
| dpad down         	| back                        	|
| dpad left         	| turn left                   	|
| dpad right        	| turn right                  	|
| left stick right  	| place forward               	|
| left stick up     	| place up                    	|
| left stick down   	| place down                  	|
| right stick right 	| break forward               	|
| right stick up    	| break up                    	|
| right stick down  	| break down                  	|
| r1                	| 1sec redstone pulse forward 	|
