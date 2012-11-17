define ['shipState', 'ExhaustState'], 
	(ShipState, ExhaustState) ->
		class State
			constructor: (settings) ->
				@shipState 	= new ShipState 	settings
				@exhaust 	= new ExhaustState	settings

			update: (commands)->
				@shipState.changeDirection 	commands.currentTurnCommand()
				@shipState.thrustOn 		commands.currentThrustCommand()
				@shipState.updatePosition()

				@exhaust.update()

				return