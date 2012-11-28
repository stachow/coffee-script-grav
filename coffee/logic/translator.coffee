define -> class Translator
			rotate: (x, y, rads) -> 
				[
					  Math.cos(-rads) * x + Math.sin(-rads) * y
					- Math.sin(-rads) * x + Math.cos(-rads) * y
				]
			translate: (point, coordinates) =>
				[ point[0] + coordinates[0], point[1] + coordinates[1] ]

			translatePoints: (points, coordinates) =>
				(@translate point, coordinates for point in points) 

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
