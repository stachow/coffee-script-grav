define ['rendererBackground','rendererShip', 'rendererExhaust', 'rendererBullet', 'rendererBase'], 
		(rendererBackground,  rendererShip,   rendererExhaust, rendererBullet,  rendererBase) ->
		  		(ctx, settings, state) ->
				  	rendererBackground 	ctx, settings, state 
				  	rendererExhaust		ctx, settings, state
				  	rendererBullet		ctx, settings, state
				  	rendererShip       	ctx, settings, state
				  	rendererBase       	ctx, settings, state
				  	ctx.translate -state.screenState.nextShiftX, -state.screenState.nextShiftY
				  	return

	