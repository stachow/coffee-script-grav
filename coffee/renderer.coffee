define ['rendererBackground','rendererShip', 'rendererExhaust', 'rendererBase'], 
		(rendererBackground,  rendererShip,   rendererExhaust,   rendererBase) ->
		  		(ctx, settings, state) ->
				  	rendererBackground 	ctx, settings, state 
				  	rendererExhaust		ctx, settings, state
				  	rendererShip       	ctx, settings, state
				  	rendererBase       	ctx, settings, state
				  	ctx.translate -state.screenState.nextShiftX, -state.screenState.nextShiftY
				  	return

	