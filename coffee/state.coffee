define ['shipState', 'ExhaustState', 'BulletState', 'ScreenState', 'BaseState', 'collisionDetect'], 
	(ShipState, ExhaustState, BulletState, ScreenState, BaseState, collisionDetect) ->
		class State
			constructor: (settings) ->
				@shipState 		= new ShipState 	settings
				@exhaustState 	= new ExhaustState	settings
				@bulletState	= new BulletState 	settings
				@screenState 	= new ScreenState 	settings
				@baseState		= new BaseState 	settings
				@condition  	= 'flying'

			update: (commands)->
				hitBase = collisionDetect.rectanglesCollide	@shipState.externalBoxPoints(), @baseState.externalBoxPoints()
				if hitBase 
					if collisionDetect.landedSafely @shipState, @baseState
						@condition = 'landed'
						@shipState.land()
					else
						@condition = 'crashed' 
				else
					@condition = 'flying'	

				if @condition == 'landed'
					@shipState.takeOff commands.currentThrustCommand()

				if @condition == 'flying'
					@shipState.changeDirection 	commands.currentTurnCommand()
					@shipState.thrustOn 		commands.currentThrustCommand()
					@shipState.shootOn 			commands.currentShootCommand()
					@shipState.updatePosition()					
					@screenState.update(@shipState)


				@exhaustState.update(@shipState)
				@bulletState.update(@shipState)
				return
