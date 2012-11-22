define ['shipShape', 'translator', 'collisionDetect'], 
		(shipShape, translator, collisionDetect) -> 
			class ShipState
				constructor: (@settings) ->
					@velocity = [0, 0]
					@direction = 0 # nose direction in radians
					@position = [0, 0]
					@thrusting = false
					@mass = 1 # this is not interesting at the moment

				changeDirection: (delta) =>
					if delta
						@direction += delta
						radFactor = 2* Math.PI
						if @direction >= radFactor 	then @direction -=radFactor
						if @direction <    0 		then @direction +=radFactor
						log @direction
					return	

				thrustOn: (bool) =>
					@thrusting = bool
					return

				updatePosition: ->
					currentForceY = @settings.game.gravity  
					currentForceY += -1 * Math.cos(@direction) * @settings.ship.thrustRatio if @thrusting
					currentForceY += -1 * @velocity[1] * @settings.game.viscosity
					currentAccelerationY = currentForceY * @mass
					@velocity[1] += currentAccelerationY
					@position[1] += @velocity[1]

					currentForceX = 0	
					currentForceX += Math.sin(@direction) * @settings.ship.thrustRatio if @thrusting
					currentForceX += -1 * @velocity[0] * @settings.game.viscosity
					currentAccelerationX = currentForceX * @mass
					
					@velocity[0] += currentAccelerationX
					@position[0] += @velocity[0]
					return

				livePoints: =>
					translator.rotate point[0], point[1], @direction for point in shipShape.points

				externalBoxPoints: =>
					collisionDetect.externalLimits @livePoints()

				engineRotatedPoints: =>
					translator.rotate point[0], point[1], @direction for point in shipShape.enginePoints