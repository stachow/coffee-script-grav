# usage: log('inside coolFunc',this,arguments);
# http://paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = ->
	log.history = log.history or []   # store logs to an array for reference
	log.history.push arguments 
	console.log(Array.prototype.slice.call arguments) if this.console
	return




require ['settings','renderer','State'], 
		( settings,  renderer,  State) ->
			
			canvas = document.getElementById 'gameScreen'
			# Augment settings from the canvas
			[settings.screen.width, settings.screen.height] = [canvas.width, canvas.height]
			ctx = canvas.getContext '2d'

			state = new State settings
			state.shipState.x = settings.screen.width - 200
			state.shipState.y = settings.screen.height - 200

			document.onkeydown = state.keyState.keyDownHandler	
			document.onkeyup = state.keyState.keyUpHandler	
			#
			#
			#
			#
			#
			#
			# should inject key state in to update, rather than have it inside 
			# will help with cancelling also
			#
			#
			#
			#
			#
			#
			#
			# game loop
			i = 0
			gameLoopId = setInterval ->
							state.update()
							renderer ctx, settings, state
							i = i + 1
							clearInterval gameLoopId if i is 1000
							return
			, 1000 / settings.screen.framesPerSecond
		

			return			





