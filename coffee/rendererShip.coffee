define ['./shipShape'], 
		(shipShape) -> 
			(ctx, settings, state) ->
				ctx.save()
				ctx.translate state.shipState.x, state.shipState.y
				
				ctx.strokeStyle = settings.ship.color
				ctx.fillStyle = 'red'

				# Centre of Gravity dot
				ctx.fillRect -1, -1, 2, 2

				rotateFactor = state.shipState.direction * Math.PI/180
			 
				ctx.rotate  rotateFactor
				# The nose
				nose = shipShape.points[0]
				ctx.moveTo nose[0], nose[1]
				ctx.beginPath()
				ctx.lineTo point[0], point[1] for point in shipShape.points
				ctx.lineTo nose[0], nose[1]
				ctx.stroke()
				ctx.rotate  -1 * rotateFactor

				ctx.translate 0, 0
				ctx.restore()
				return
					