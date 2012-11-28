define ['shape/shipShape', 'logic/Translator'], 
		(shipShape, Translator) -> 
			class ShipState
				constructor: (@settings) ->
					@velocity = [0, 0]
					@direction = 0 # nose direction in radians
					@position = [0, 0]
					@thrusting = false
					@shooting = false
					@landed	  = false
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

				shootOn: (bool) =>
					@shooting = bool
					return	

				update: ->
					return if @landed
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
					return @translator.translatePoints rotatedPoints, @position 
					
				liveEnginePoint: =>
					rotatedPoint = @translator.rotate shipShape.enginePoints[1][0], shipShape.enginePoints[1][1], @direction
					return @translator.translate rotatedPoint, @position

				liveNosePoint: =>
					@livePoints()[0]

				externalBoxPoints: =>
					@translator.externalLimits @livePoints()

				engineRotatedPoints: =>
					rotatedPoints = (@translator.rotate point[0], point[1], @direction for point in shipShape.enginePoints)
					return (@translator.translate point, @position for point in rotatedPoints)

				land: =>

					@landed 	= true
					@velocity 	= [0, 0]
					@thrusting 	= false			
					@direction 	= 0	
					return

				takeOff: (bool) =>
					@landed 		= false if bool
					@thrusting 		= bool
					@position[1] 	-= 2 if bool
					return	
