define ->
		class Commands
			constructor: (@settings) ->
				@commands = 
					left: 	false
					right:	false
					thrust: false
					stop:	false

			currentTurnCommand: =>
				return @settings.ship.turnRatio   		if @commands.right and not @commands.left
				return -1 * @settings.ship.turnRatio  	if @commands.left  and not @commands.right
				return 0 
		
			currentThrustCommand: =>
				return @commands.thrust

			quitCommand: =>
				return @commands.stop

			keyDownHandler: (e) => @_generalHandler(e, true)

			keyUpHandler: (e) => @_generalHandler(e, false)

			_generalHandler: (e, sense) =>
				keyId = e[if e.charCode then 'charCode' else 'keyCode']
				command = @settings.game.keyCommandMap[keyId]
				if command? then @commands[command] = sense
