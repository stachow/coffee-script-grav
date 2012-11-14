screen = 
	init:(el) ->
		ctx = el.getContext("2d")
		h = el.height
		w = el.width

		ctx.beginPath
		ctx.lineTo point[0], point[1] for point in [[w,0], [w,h], [0,h],[0,0]]
		ctx.closePath

		ctx.fillStyle = '#eeeeee'
		ctx.fill()

		console.log "Hello from screen init"
		return

#exports.screen=screen