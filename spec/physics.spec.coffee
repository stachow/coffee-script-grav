physics = require('../js/physics.js').physics

describe "The physics engine",  ->
	it "should return the correct acceleration", ->
		expect(physics.acceleration(2, 10)).toEqual(5)
	it "should return the correct energy", ->
		expect(physics.energy(10,5)).toEqual(125)