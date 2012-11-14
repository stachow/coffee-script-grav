physics = 
	acceleration: (mass, force) ->
		force / mass 
	energy: (mass, velocity) ->
		0.5 * mass * velocity * velocity



exports.physics = physics