define ->
		(ctx, settings) -> 
			ctx.fillStyle = settings.background.color
			ctx.fillRect 0, 0, settings.screen.width, settings.screen.height
			return