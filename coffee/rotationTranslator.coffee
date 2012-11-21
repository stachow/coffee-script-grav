define ->

	###
		In our world, as we are looking at the canvas, 
		(x, y) = (0,0) is the top-left of the canvas, so...

		-	x increases as we move right
		-	y increases as we move down
		-	rads the clockwise angle is from the upward vertical 
	###
	(x, y, rads) -> 
		[
			  Math.cos(-rads) * x + Math.sin(-rads) * y
			- Math.sin(-rads) * x + Math.cos(-rads) * y
		]