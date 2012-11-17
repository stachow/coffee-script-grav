define ->
		(ctx, settings) -> 
			h = settings.screen.height
			w = settings.screen.width
			ctx.clearRect 0, 0, w, h

			ctx.fillStyle = settings.background.color
			ctx.fillRect 0, 0, settings.screen.width, settings.screen.height

			ctx.strokeStyle = settings.background.gridColor
			for i in [0.5..w] by 100
				ctx.beginPath()
				ctx.moveTo i, 0 
				ctx.lineTo i, h
				ctx.stroke()
			for i in [0.5..h] by 100
				ctx.beginPath()
				ctx.moveTo 0, i
				ctx.lineTo w, i
				ctx.stroke();


			return
