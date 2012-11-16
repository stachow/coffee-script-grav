// Generated by CoffeeScript 1.4.0
var physics;

physics = require('../js/physics.js').physics;

describe("The physics engine", function() {
  it("should return the correct acceleration", function() {
    return expect(physics.acceleration(2, 10)).toEqual(5);
  });
  return it("should return the correct energy", function() {
    return expect(physics.energy(10, 5)).toEqual(125);
  });
});