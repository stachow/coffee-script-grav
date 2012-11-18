define ['rendererBackground','rendererShip', 'rendererExhaust'], 
		(rendererBackground,  rendererShip,   rendererExhaust) ->
		  		(ctx, settings, state) ->
				  	rendererBackground 	ctx, settings 
				  	rendererExhaust		ctx, settings, state
				  	rendererShip       	ctx, settings, state
	
				  	return

	