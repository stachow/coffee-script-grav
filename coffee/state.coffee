define ['shipState', 'ExhaustState', 'ScreenState', 'BaseState'], 
	(ShipState, ExhaustState, ScreenState, BaseState) ->
		class State
			constructor: (settings) ->
				@shipState 	= new ShipState 	settings
				@exhaust 	= new ExhaustState	settings
				@screenState= new ScreenState 	settings
				@baseState	= new BaseState 	settings

			update: (commands)->
				@shipState.changeDirection 	commands.currentTurnCommand()
				@shipState.thrustOn 		commands.currentThrustCommand()
				@shipState.updatePosition()
				@exhaust.update(@shipState)

				@screenState.update(@shipState)

				return