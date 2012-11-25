define ['shipShape', 'Translator', 'collisionDetect'], 
		(shipShape, Translator, collisionDetect) -> 
			class ShipState
				constructor: (@settings) ->
					@velocity = [0, 0]
					@direction = 0 # nose direction in radians
					@position = [0, 0]
					@thrusting = false
					@mass = 1 # this is not interesting at the moment
					@translator = new Translator
				changeDirection: (delta) =>
					if delta
						@direction += delta
						radFactor = 2* Math.PI
						if @direction >= radFactor 	then @direction -=radFactor
						if @direction <    0 		then @direction +=radFactor
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
					rotatedPoints = (@translator.rotate point[0], point[1], @direction for point in shipShape.points)
					translatedPoints = @translator.translatePoints rotatedPoints, @position 
					return translatedPoints

				externalBoxPoints: =>
					collisionDetect.externalLimits @livePoints()

				engineRotatedPoints: =>
					rotatedPoints = (@translator.rotate point[0], point[1], @direction for point in shipShape.enginePoints)
					return (@translator.translate point, @position for point in rotatedPoints)

				land: =>
					@velocity 	= [0, 0]
					@thrusting 	= false			
					@direction = 0	
					return

				takeOff: (bool) =>
					@thrusting 	= bool
					@position[1] -= 2 if bool
					return	
