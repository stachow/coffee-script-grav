define ['shipShape'], 
		(shipShape) -> 
			(ctx, settings, state) ->
				ctx.save()

				ctx.translate state.shipState.positionX, state.shipState.positionY
				ctx.rotate    state.shipState.direction 
				ctx.strokeStyle = ctx.fillStyle = settings.ship.color
				
				# The nose
				nose = shipShape.points[0]
				
				# Draw ship
				ctx.moveTo nose[0], nose[1]
				ctx.beginPath()
				ctx.lineTo point[0], point[1] for point in shipShape.points
				ctx.lineTo nose[0], nose[1]
				ctx.stroke()
				ctx.fillStyle = settings.ship.fillColor
				ctx.fill()

				# Draw engine
				if state.shipState.thrusting
					ctx.strokeStyle = settings.ship.engineColor
					ctx.lineWidth = 2
					ctx.beginPath()
					ctx.lineTo point[0], point[1] for point in shipShape.enginePoints
					ctx.stroke()					


				# Centre of Gravity dot
				ctx.fillStyle = settings.ship.color
				ctx.fillRect -1, -1, 2, 2


				ctx.restore()
				return
					