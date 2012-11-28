# usage: log('inside coolFunc',this,arguments);
# http://paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = ->
	log.history = log.history or []   # store logs to an array for reference
	log.history.push arguments 
	console.log(Array.prototype.slice.call arguments) if this.console
	return

require ['settings','render/render','state/State','environ/Commands','environ/browser', 'level/level01'], 
		( settings,  render,  		 State,  	   Commands,  		  browser,			 level01 ) ->
			
			canvas = browser.getCanvas 'gameScreen'
			[ctx, settings.screen.width, settings.screen.height] = [canvas.getContext('2d'), canvas.width, canvas.height]

			commands = new Commands	settings
			browser.bindCommands commands			

			state = new State settings
			state.startLevel level01
			
			# game loop
			gameLoopId = setInterval ->
							clearInterval gameLoopId if commands.quitCommand()
							clearInterval gameLoopId if state.condition == 'crashed'
							state.update commands
							render ctx, settings, state

			, 1000 / settings.screen.framesPerSecond
		
			return			





