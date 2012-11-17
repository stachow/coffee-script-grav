define ['rendererBackground','rendererShip', 'rendererExhaust'], 
		(rendererBackground,  rendererShip,   rendererExhaust) ->
		  		(ctx, settings, state) ->
				  	rendererBackground 	ctx, settings 
				  	rendererShip       	ctx, settings, state
				  	rendererExhaust		ctx, settings, state
				  	return

	