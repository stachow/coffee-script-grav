define ['physics'], 
	(physics)->
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

			thrustOn: (bool) =>
				@thrusting = bool

			updatePosition: ->
				self = @
				calc = (def)->
					currentForce = def[2]
					
					if @thrusting
						currentForce -= self.settings.ship.thrustRatio * def[1] self.direction 
					
					currentAcceleration = currentForce * self.mass
					self['velocity' + def[0]] += currentAcceleration
					self['position' + def[0]] += currentAcceleration

				directionDefs = [
					['X', Math.sin, 0]  
					['Y', Math.cos, @settings.game.gravity]
				]
				
				calc def for def in directionDefs

				# currentForceY = @settings.game.gravity - if @thrusting then @settings.ship.thrustRatio else 0 
				# currentAccelerationY = currentForceY * @mass
				# @velocityY += currentAccelerationY
				# @positionY += @velocityY
