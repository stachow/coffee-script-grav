define ['./physics'], 
	(physics)->
		class ShipState
			constructor: (settings) ->
				@velocity = 0
				@direction = 0
				@x = 0
				@y = 0
				@thrust = settings.thrust

			go: ->