define ->
	(ctx, settings, state) ->
		ctx.save()
		ctx.fillStyle = settings.ship.bullet.color
		ctx.fillRect bullet[0] - 1 , bullet[1] - 1, 2, 2 for bullet in state.bulletState.bullets
		ctx.restore()
		return
		