
define ->

	# usage: log('inside coolFunc',this,arguments);
	# http://paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
	window.log = ->
		log.history = log.history or []   # store logs to an array for reference
		log.history.push arguments 
		console.log(Array.prototype.slice.call arguments) if this.console
		return

	return {}

	  	
