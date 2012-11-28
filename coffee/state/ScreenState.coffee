define ->
	class ScreenState
		constructor: (@settings) ->
			@position = [0,0]
			@nextShiftX = 0
			@nextShiftY = 0
		update: (shipState) ->

			@nextShiftX = 0
			@nextShiftY = 0

			strayRightThreshold = @position[0] + @settings.screen.width - @settings.screen.panWhenWithin
			strayRightAmount = shipState.position[0] - strayRightThreshold
			if strayRightAmount > 0 and @position[0] < (@settings.game.width - @settings.screen.width)
				@nextShiftX = strayRightAmount
				@position[0] += @nextShiftX 
			else	
				strayLeftThreshold = @position[0] + @settings.screen.panWhenWithin
				strayLeftAmount = strayLeftThreshold - shipState.position[0]
				if strayLeftAmount > 0 and @position[0] > 0
					@nextShiftX = -strayLeftAmount
					@position[0] += @nextShiftX 

			strayBottomThreshold = @position[1] + @settings.screen.height - @settings.screen.panWhenWithin
			strayBottomAmount = shipState.position[1] - strayBottomThreshold
			if strayBottomAmount > 0 and @position[1] < (@settings.game.height - @settings.screen.height)
				@nextShiftY = strayBottomAmount
				@position[1] += @nextShiftY 
			else	
				strayTopThreshold = @position[1] + @settings.screen.panWhenWithin
				strayTopAmount = strayTopThreshold - shipState.position[1]
				if strayTopAmount > 0 and @position[1] > 0
					@nextShiftY = -strayTopAmount
					@position[1] += @nextShiftY 