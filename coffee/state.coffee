define ['shipState', 'ExhaustState', 'ScreenState', 'BaseState', 'collisionDetect'], 
	(ShipState, ExhaustState, ScreenState, BaseState, collisionDetect) ->
		class State
			constructor: (settings) ->
				@shipState 	= new ShipState 	settings
				@exhaust 	= new ExhaustState	settings
				@screenState= new ScreenState 	settings
				@baseState	= new BaseState 	settings
				@condition = 'flying'

			update: (commands)->
				@shipState.changeDirection 	commands.currentTurnCommand()
				@shipState.thrustOn 		commands.currentThrustCommand()
				@shipState.updatePosition()

				@condition = @conditionUpdate()

				@exhaust.update(@shipState)
				@screenState.update(@shipState)
				return

			conditionUpdate: () ->
				hitBase = collisionDetect.rectanglesCollide	@shipState.externalBoxPoints(), @baseState.externalBoxPoints()
				if hitBase 
					return if collisionDetect.landedSafely @shipState, @baseState then 'landed' else 'crashed' 
				return 'flying'	
				# ok, landed, collided

