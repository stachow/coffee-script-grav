define ['./shipState'], 
	(ShipState) ->
		class State
			constructor: (settings) ->
				@shipState 	= new ShipState settings

			update: (commands)->
				@shipState.changeDirection 	commands.currentTurnCommand()
				@shipState.thrustOn 		commands.currentThrustCommand()
				@shipState.updatePosition()
				return