define [ 'rotationTranslator'], 
		(rotationTranslator) -> 
			(ctx, settings, state) ->
				ctx.save()

				ctx.translate state.shipState.positionX, state.shipState.positionY
				#ctx.rotate    state.shipState.direction 
				ctx.strokeStyle = ctx.fillStyle = settings.ship.color

				pointSet = state.shipState.livePoints()
				
				# Draw ship
				ctx.moveTo pointSet[0][0], pointSet[0][1]
				ctx.beginPath()
				ctx.lineTo point[0], point[1] for point in pointSet
				ctx.closePath()
				ctx.stroke()
				ctx.fillStyle = settings.ship.fillColor
				ctx.fill()

				# Draw engine
				if state.shipState.thrusting
					ctx.strokeStyle = settings.ship.engineColor
					ctx.lineWidth = 2
					ctx.beginPath()
					ctx.lineTo point[0], point[1] for point in state.shipState.engineRotatedPoints()
					ctx.stroke()					


				# Centre of Gravity dot
				ctx.fillStyle = settings.ship.color
				ctx.fillRect -1, -1, 2, 2

				# Draw external box
				externalPoints = state.shipState.externalBoxPoints()
				ctx.moveTo externalPoints[0][0], externalPoints[0][1]
				ctx.beginPath()
				ctx.lineTo point[0], point[1] for point in externalPoints
				ctx.lineTo externalPoints[0][0], externalPoints[0][1]
				ctx.stroke()


				ctx.restore()
				return
					