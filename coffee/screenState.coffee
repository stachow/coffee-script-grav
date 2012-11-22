define ->
	class ScreenState
		constructor: (@settings) ->
			@positionX 	= 0
			@positionY 	= 0
			@nextShiftX = 0
			@nextShiftY = 0
		update: (shipState) ->

			@nextShiftX = 0
			@nextShiftY = 0

			strayRightThreshold = @positionX + @settings.screen.width - @settings.screen.panWhenWithin
			strayRightAmount = shipState.positionX - strayRightThreshold
			if strayRightAmount > 0 and @positionX < (@settings.game.width - @settings.screen.width)
				@nextShiftX = strayRightAmount
				@positionX += @nextShiftX 
			else	
				strayLeftThreshold = @positionX + @settings.screen.panWhenWithin
				strayLeftAmount = strayLeftThreshold - shipState.positionX
				if strayLeftAmount > 0 and @positionX > 0
					@nextShiftX = -strayLeftAmount
					@positionX += @nextShiftX 

			strayBottomThreshold = @positionY + @settings.screen.height - @settings.screen.panWhenWithin
			strayBottomAmount = shipState.positionY - strayBottomThreshold
			if strayBottomAmount > 0 and @positionY < (@settings.game.height - @settings.screen.height)
				@nextShiftY = strayBottomAmount
				@positionY += @nextShiftY 
			else	
				strayTopThreshold = @positionY + @settings.screen.panWhenWithin
				strayTopAmount = strayTopThreshold - shipState.positionY
				if strayTopAmount > 0 and @positionY > 0
					@nextShiftY = -strayTopAmount
					@positionY += @nextShiftY 