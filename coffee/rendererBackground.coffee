define ->
		(ctx, settings) -> 
			h = settings.screen.height
			w = settings.screen.width
			ctx.clearRect 0, 0, w, h

			ctx.fillStyle = settings.background.color
			ctx.fillRect 0, 0, settings.screen.width, settings.screen.height

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
			h = settings.game.height
			w = settings.game.width
			ctx.beginPath()
			ctx.moveTo 0, 0
			ctx.lineTo 0, h	
			ctx.stroke()
			ctx.lineTo w, h
			ctx.stroke()
			ctx.lineTo w, 0
			ctx.stroke()
			ctx.lineTo 0, 0	
			ctx.stroke()
			return
