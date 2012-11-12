physics = require('../js/physics.js')

describe "The physics engine",  ->
	it "Should return the correct acceleration", ->
		expect(physics.acceleration(2, 10)).toEqual(5)