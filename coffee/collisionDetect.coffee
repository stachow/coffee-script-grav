define ->
	landed: (shipState, baseState) ->
	 	false

	externalLimits: (points) ->
		minX = maxX = minY = maxY = 0
		for point in points
			minX = point[0] if point[0] < minX
			maxX = point[0] if point[0] > maxX
			minY = point[1] if point[1] < minY
			maxY = point[1] if point[1] > maxY
		return [[minX, minY], [maxX, maxY]]

	rectanglesCollide: (shapeExternals1, shapeExternals2) ->
	 	return 	shapeExternals1[0][0] < shapeExternals2[1][0] and 
	 			shapeExternals1[1][0] > shapeExternals2[0][0] and
    			shapeExternals1[0][1] < shapeExternals2[1][1] and 
    			shapeExternals1[1][1] > shapeExternals2[0][1] 
