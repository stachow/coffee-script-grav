define ->
		class KeyState
			constructor: (@settings) ->
				@leftArrowDown 	= false
				@rightArrowDown	= false
				log @settings
			
			currentCommand: =>
				return @settings.ship.turnRatio  		if @rightArrowDown
				return -1 * @settings.ship.turnRatio  	if @leftArrowDown
				return 0 
		
			keyDownHandler: (e) =>
				keyID = event[if event.charCode then 'charCode' else 'keyCode']
				@leftArrowDown 	= true if keyID is @settings.screen.leftButtonCode
				@rightArrowDown = true if keyID is @settings.screen.rightButtonCode

			keyUpHandler: (e) =>
				keyID = event[if event.charCode then 'charCode' else 'keyCode']
				@leftArrowDown 	= false if keyID is @settings.screen.leftButtonCode
				@rightArrowDown = false if keyID is @settings.screen.rightButtonCode

			