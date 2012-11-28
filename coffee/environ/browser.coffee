define ->
	
	getCanvas : (id) ->
		window.document.getElementById id

	bindCommands: (commands) ->
		window.document.onkeydown 	= commands.keyDownHandler
		window.document.onkeyup		= commands.keyUpHandler
