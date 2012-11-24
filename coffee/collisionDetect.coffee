define [ 'settings'],
		( settings)->
			externalLimits: (points) ->
				pointZero = points[0]
				minX = maxX = pointZero[0] 
				minY = maxY = pointZero[1]
				for point in points[1..]
					minX = point[0] if point[0] < minX
					maxX = point[0] if point[0] > maxX
					minY = point[1] if point[1] < minY
					maxY = point[1] if point[1] > maxY
				return [[minX, minY], [maxX, maxY]]

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
			

						 	return true		