define ['./physics'], 
	(physics)->
		class ShipState
			constructor: (settings) ->
				@velocity = 0
				@direction = 0 #let's do this in rads 360 degrees = 2*pi 
				@x = 0
				@y = 0
				@thrust = settings.ship.thrust

			go: ->
		