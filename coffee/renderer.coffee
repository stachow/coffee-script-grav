define ['rendererBackground','rendererShip', 'rendererExhaust'], 
		(rendererBackground,  rendererShip,   rendererExhaust) ->
		  		(ctx, settings, state) ->
				  	ctx.translate 0, 0
				  	rendererBackground 	ctx, settings, state 
				  	rendererExhaust		ctx, settings, state
				  	rendererShip       	ctx, settings, state
				  	ctx.translate -state.screenState.nextShiftX, -state.screenState.nextShiftY
				  	return

	