define ->
	(ctx, settings, state) ->
		ctx.save()
		ctx.fillStyle = if state.condition == 'landed' then settings.base.colorLanded else settings.base.color
		pointSet = state.baseState.livePoints()
		
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
	