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
