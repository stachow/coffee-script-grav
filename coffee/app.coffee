# usage: log('inside coolFunc',this,arguments);
# http://paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = ->
	log.history = log.history or []   # store logs to an array for reference
	log.history.push arguments 
	console.log(Array.prototype.slice.call arguments) if this.console
	return

require ['settings','renderer','State','Commands','browser'], 
		( settings,  renderer,  State,  Commands,  browser ) ->
			
			canvas = browser.getCanvas 'gameScreen'
			[ctx, settings.screen.width, settings.screen.height] = [canvas.getContext('2d'), 
																	canvas.width, canvas.height]

			commands = new Commands	settings
			browser.bindCommands commands			

			state = new State settings
			state.shipState.position[0] = settings.screen.width / 2
			state.shipState.position[1] = 200
			state.screenState.position[0] = 0
			state.screenState.position[1] = 0
			state.baseState.position[0] = settings.screen.width / 2
			state.baseState.position[1] = 400
			
			# game loop
			gameLoopId = setInterval ->
							clearInterval gameLoopId if commands.quitCommand()
							state.update commands
							renderer ctx, settings, state

			, 1000 / settings.screen.framesPerSecond
		
			return			





