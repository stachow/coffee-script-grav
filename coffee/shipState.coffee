define ['shipShape', 'rotationTranslator'], 
		(shipShape, rotationTranslator) -> 
			class ShipState
				constructor: (@settings) ->
					@velocityX = 0
					@velocityY = 0
					@direction = 0 # nose direction in radians
					@positionX = 0
					@positionY = 0
					@thrusting = false
					@mass = 1 # this is not interesting at the moment

				changeDirection: (delta) =>
					if delta
						@direction += delta
						radFactor = Math.PI/180
						if @direction >= radFactor 	then @direction -=radFactor
						if @direction <    0 		then @direction +=radFactor
					return	

				thrustOn: (bool) =>
					@thrusting = bool
					return

				updatePosition: ->
					currentForceY = @settings.game.gravity  
					currentForceY += -1 * Math.cos(@direction) * @settings.ship.thrustRatio if @thrusting
					currentForceY += -1 * @velocityY * @settings.game.viscosity
					currentAccelerationY = currentForceY * @mass
					@velocityY += currentAccelerationY
					@positionY += @velocityY

					currentForceX = 0	
					currentForceX += Math.sin(@direction) * @settings.ship.thrustRatio if @thrusting
					currentForceX += -1 * @velocityX * @settings.game.viscosity
					currentAccelerationX = currentForceX * @mass
					
					@velocityX += currentAccelerationX
					@positionX += @velocityX
					return

				rotatedPoints: =>
						rotationTranslator point[0], point[1], @direction for point in shipShape.points

				externalBoxPoints: =>
					minX = maxX = minY = maxY = 0
					for point in @rotatedPoints()
						minX = point[0] if point[0] < minX
						maxX = point[0] if point[0] > maxX
						minY = point[1] if point[1] < minY
						maxY = point[1] if point[1] > maxY
					return [
								[minX, minY]
								[minX, maxY]
								[maxX, maxY]
								[maxX, minY]	
							]

				engineRotatedPoints: =>
						rotationTranslator point[0], point[1], @direction for point in shipShape.enginePoints