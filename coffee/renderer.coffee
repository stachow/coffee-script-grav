define ['rendererBackground','rendererShip', 'rendererExhaust'], 
		(rendererBackground,  rendererShip,   rendererExhaust) ->
		  		(ctx, settings, state) ->
				  	rendererBackground 	ctx, settings, state 
				  	rendererExhaust		ctx, settings, state
				  	rendererShip       	ctx, settings, state
				  	ctx.translate -state.screenState.nextShiftX, -state.screenState.nextShiftY
				  	return

	