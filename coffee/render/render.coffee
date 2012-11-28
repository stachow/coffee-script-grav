define ['render/renderBackground','render/renderShip', 'render/renderExhaust', 'render/renderBullet', 'render/renderBase'], 
		(renderBackground,  renderShip,   renderExhaust, renderBullet,  renderBase) ->
		  		(ctx, settings, state) ->
				  	renderBackground 	ctx, settings, state 
				  	renderExhaust		ctx, settings, state
				  	renderBullet		ctx, settings, state
				  	renderShip       	ctx, settings, state
				  	renderBase       	ctx, settings, state
				  	ctx.translate -state.screenState.nextShiftX, -state.screenState.nextShiftY
				  	return

	