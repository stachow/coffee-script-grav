define ['shipState', 'ExhaustState', 'ScreenState'], 
	(ShipState, ExhaustState, ScreenState) ->
		class State
			constructor: (settings) ->
				@shipState 	= new ShipState 	settings
				@exhaust 	= new ExhaustState	settings
				@screenState= new ScreenState 	settings

			update: (commands)->
				@shipState.changeDirection 	commands.currentTurnCommand()
				@shipState.thrustOn 		commands.currentThrustCommand()
				@shipState.updatePosition()
				@exhaust.update(@shipState)

				@screenState.update(@shipState)

				return