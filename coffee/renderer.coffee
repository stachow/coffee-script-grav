define ['rendererBackground','rendererShip'], 
		  (rendererBackground,    rendererShip) ->
		  		(ctx, settings, state) ->
				  	rendererBackground ctx, settings 
				  	rendererShip       ctx, settings, state
				  	return

	