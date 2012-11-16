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

			#
			state = new State settings
			state.shipState.x = 200
			state.shipState.y = 300

			renderer ctx, settings, state

			
			return			





