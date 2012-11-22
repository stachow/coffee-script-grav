define ['translator', 'settings'],
		(translator, settings)->
			externalLimits: (points) ->
				minX = maxX = minY = maxY = 0
				for point in points
					minX = point[0] if point[0] < minX
					maxX = point[0] if point[0] > maxX
					minY = point[1] if point[1] < minY
					maxY = point[1] if point[1] > maxY
				return [[minX, minY], [maxX, maxY]]

			rectanglesCollide: (shapeExternals1, position1, shapeExternals2, position2) ->
				translatedBox1 = (translator.translate point, position1 for point in shapeExternals1)
				translatedBox2 = (translator.translate point, position2 for point in shapeExternals2)
				return 	translatedBox1[0][0] < translatedBox2[1][0] and 
						translatedBox1[1][0] > translatedBox2[0][0] and
						translatedBox1[0][1] < translatedBox2[1][1] and 
						translatedBox1[1][1] > translatedBox2[0][1] 

			landedSafely: (shipState, baseState) ->
				# we've got to be 
				#	- travelling downwards (i.e. hit the top)
				#	- not be travelling too fast downwards
				#	- not be travelling too fast sidewards
				#	- both edges of the ship must be within the base edges
				#	- got to be at a reasonably vertical angle
						 	settings.ship.landing.maxDownwardSpeed >= shipState.velocity[1] >= 0
						 	Math.abs(shipState.velocity[0]) <= settings.ship.landing.maxSidewardSpeed
						 	shipState.direction >= 2 * Math.pi - settings.ship.landing.maxAngleFromVertical
						 	# or
						 	shipState.direction <= settings.ship.landing.maxAngleFromVertical
						 	
						 	false
