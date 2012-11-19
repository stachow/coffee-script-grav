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
			if strayRightAmount > 0 and @positionX < @settings.game.width
				@nextShiftX = strayRightAmount
				@positionX += @nextShiftX 
				log 'Strayed Right', @positionX
			else	
				strayLeftThreshold = @positionX + @settings.screen.panWhenWithin
				strayLeftAmount = strayLeftThreshold - shipState.positionX
				if strayLeftAmount > 0 and @positionX > 0
					@nextShiftX = -strayLeftAmount
					@positionX += @nextShiftX 
					log 'Strayed Left', @positionX

			strayBottomThreshold = @positionY + @settings.screen.height - @settings.screen.panWhenWithin
			strayBottomAmount = shipState.positionY - strayBottomThreshold
			if strayBottomAmount > 0 and @positionY < @settings.game.height
				@nextShiftY = strayBottomAmount
				@positionY += @nextShiftY 
				log 'Strayed Bottom', @positionY
			else	
				strayTopThreshold = @positionY + @settings.screen.panWhenWithin
				strayTopAmount = strayTopThreshold - shipState.positionY
				if strayTopAmount > 0 and @positionY > 0
					@nextShiftY = -strayTopAmount
					@positionY += @nextShiftY 
					log 'Strayed Top', @positionY