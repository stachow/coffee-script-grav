// Generated by CoffeeScript 1.4.0
var physics;

physics = require('../js/physics.js');

describe("The physics engine", function() {
  return it("Should return the correct acceleration", function() {
    return expect(physics.acceleration(2, 10)).toEqual(5);
  });
});
