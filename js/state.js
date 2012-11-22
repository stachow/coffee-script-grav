// Generated by CoffeeScript 1.4.0

define(['shipState', 'ExhaustState', 'ScreenState', 'BaseState', 'collisionDetect'], function(ShipState, ExhaustState, ScreenState, BaseState, collisionDetect) {
  var State;
  return State = (function() {

    function State(settings) {
      this.shipState = new ShipState(settings);
      this.exhaust = new ExhaustState(settings);
      this.screenState = new ScreenState(settings);
      this.baseState = new BaseState(settings);
    }

    State.prototype.update = function(commands) {
      this.shipState.changeDirection(commands.currentTurnCommand());
      this.shipState.thrustOn(commands.currentThrustCommand());
      this.shipState.updatePosition();
      this.exhaust.update(this.shipState);
      this.screenState.update(this.shipState);
    };

    State.prototype.collided = function() {
      return collisionDetect.rectanglesCollide(this.shipState.externalBoxPoints(), this.baseState.externalBoxPoints());
    };

    return State;

  })();
});
