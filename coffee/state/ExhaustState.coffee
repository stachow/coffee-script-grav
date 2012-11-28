define ->
	class ExhaustState
			constructor: (@settings) ->
				@puffs = []
				@clock = 0

			update: (shipState)->
				for puff in @puffs
					puff[0] +=1
					if puff[0] >= @settings.ship.exhaust.disappearFactor
						@puffs = @puffs[1..] # assume the first one in the list is the oldest and first to die 
				
				@clock += 1
				if @clock >= @settings.ship.exhaust.frequencyFactor	
					@clock = 0
					@puffs.push [0, shipState.liveEnginePoint()[0], shipState.liveEnginePoint()[1]] if shipState.thrusting
					
