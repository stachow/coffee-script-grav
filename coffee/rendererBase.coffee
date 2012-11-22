define ->
	(ctx, settings, state) ->
		ctx.save()
		ctx.translate state.baseState.positionX, state.baseState.positionY
		ctx.fillStyle = settings.base.color
		pointSet = state.baseState.livePoints()
		log pointSet
		# Draw ship
		ctx.beginPath()
		ctx.moveTo pointSet[0][0], pointSet[0][1]

		#log point[0] for point in pointSet
		ctx.lineTo point[0], point[1] for point in pointSet
		ctx.closePath()
		ctx.stroke()
		ctx.fill()

		ctx.restore()
		return
	