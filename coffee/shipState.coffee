define ['./physics'], 
	(physics)->
		class ShipState
			constructor: (settings) ->
				@velocity = 0
				@direction = 0 # in degrees
				@x = 0
				@y = 0
				@thrust = settings.ship.thrust

			go: ->

			changeDirection: (delta) ->
				@direction += delta
				if @direction >= 360 then @direction -=360
				if @direction <    0 then @direction +=360