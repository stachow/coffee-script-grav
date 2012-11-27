define ->
	(ctx, settings, state) ->
		ctx.save()
		ctx.fillStyle = settings.ship.exhaust.color
		ctx.fillRect puff[1] - 1 , puff[2] - 1, 2, 2 for puff in state.exhaustState.puffs
		ctx.restore()
		return
		