define ->
		(ctx, settings, state) -> 
			ctx.save()
			h = settings.game.height
			w = settings.game.width
			ctx.clearRect 0, 0, w, h

			ctx.fillStyle = settings.background.color
			ctx.fillRect 0, 0, w, h

			ctx.strokeStyle = settings.background.gridColor
			
			# optimizable - one loop
			for i in [0.5..w] by 100
				ctx.beginPath()
				ctx.moveTo i, 0 
				ctx.lineTo i, h
				ctx.stroke()
			for i in [0.5..h] by 100
				ctx.beginPath()
				ctx.moveTo 0, i
				ctx.lineTo w, i
				ctx.stroke()

			ctx.strokeStyle = settings.background.borderColor
			ctx.strokeStyle = settings.background.borderColorAlert if state.condition == 'crashed'


			# h = settings.screen.height  
			# w = settings.screen.width 
			# x = state.screenState.position[0] + 0.5
			# y = state.screenState.position[1] + 0.5

			# ctx.beginPath()
			# ctx.moveTo x, y
			# ctx.lineTo x, y + h	
			# ctx.stroke()
			# ctx.lineTo x + w, y + h
			# ctx.stroke()
			# ctx.lineTo x + w, y
			# ctx.stroke()
			# ctx.lineTo x, y	
			# ctx.stroke()
			
			
			ctx.restore()
			return
