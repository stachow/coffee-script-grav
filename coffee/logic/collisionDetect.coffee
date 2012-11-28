define [ 'settings'],
		( settings)->

			rectanglesCollide: (shapeExternals1, shapeExternals2) ->
				theyDoCollide= 	shapeExternals1[0][0] < shapeExternals2[1][0] and 
								shapeExternals1[1][0] > shapeExternals2[0][0] and
								shapeExternals1[0][1] < shapeExternals2[1][1] and 
								shapeExternals1[1][1] > shapeExternals2[0][1] 
				return theyDoCollide				

			landedSafely: (shipState, baseState) ->
				# we've got to be 
				#	- travelling downwards (i.e. hit the top)
				#	- not be travelling too fast downwards
				#	- not be travelling too fast sidewards
				#	- both edges of the ship must be within the base edges
				#	- got to be at a reasonably vertical angle
				if not (settings.ship.landing.maxDownwardSpeed >= shipState.velocity[1] >= 0)
					log 'Speed too much or upwards'
					return false	
				if Math.abs(shipState.velocity[0]) >= settings.ship.landing.maxSidewardSpeed 
					log 'Sidewards speed too much'
					return false
				if shipState.direction <= 2 * Math.pi - settings.ship.landing.maxAngleFromVertical and
				shipState.direction >= settings.ship.landing.maxAngleFromVertical
					log 'Angle too much'
					return false
				if shipState.externalBoxPoints()[0][0] < baseState.externalBoxPoints()[0][0] or 
				shipState.externalBoxPoints()[1][0] > baseState.externalBoxPoints()[1][0]
					log 'Off the edge'
					return false
				return true		