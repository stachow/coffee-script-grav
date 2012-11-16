define ['./shipShape'], 
		(shipShape) -> 
			(ctx, settings, state) ->
				[startX, startY] = [state.shipState.x, state.shipState.y]
				
				ctx.save()
				ctx.strokeStyle = settings.ship.color
				ctx.fillStyle = 'red'


				ctx.translate startX, startY


				# Centre of Gravity dot
				ctx.fillRect -1, -1, 2, 2
				ctx.rotate 45*Math.PI/180 
				# The nose
				nose = shipShape.points[0]

				
				ctx.moveTo nose[0], nose[1]
				ctx.beginPath()
				ctx.lineTo point[0], point[1] for point in shipShape.points
				ctx.lineTo nose[0], nose[1]
				ctx.stroke()


				ctx.translate 0, 0
				ctx.restore()
				return
					