// Generated by CoffeeScript 1.4.0

define(['shipState', 'ExhaustState', 'BulletState', 'ScreenState', 'BaseState', 'collisionDetect'], function(ShipState, ExhaustState, BulletState, ScreenState, BaseState, collisionDetect) {
  var State;
  return State = (function() {

    function State(settings) {
      this.shipState = new ShipState(settings);
      this.exhaustState = new ExhaustState(settings);
      this.bulletState = new BulletState(settings);
      this.screenState = new ScreenState(settings);
      this.baseState = new BaseState(settings);
      this.condition = 'flying';
    }

    State.prototype.update = function(commands) {
      var hitBase;
      hitBase = collisionDetect.rectanglesCollide(this.shipState.externalBoxPoints(), this.baseState.externalBoxPoints());
      if (hitBase) {
        if (collisionDetect.landedSafely(this.shipState, this.baseState)) {
          this.condition = 'landed';
          this.shipState.land();
        } else {
          this.condition = 'crashed';
        }
      } else {
        this.condition = 'flying';
      }
      if (this.condition === 'landed') {
        this.shipState.takeOff(commands.currentThrustCommand());
      }
      if (this.condition === 'flying') {
        this.shipState.changeDirection(commands.currentTurnCommand());
        this.shipState.thrustOn(commands.currentThrustCommand());
        this.shipState.shootOn(commands.currentShootCommand());
        this.shipState.updatePosition();
        this.screenState.update(this.shipState);
      }
      this.exhaustState.update(this.shipState);
      this.bulletState.update(this.shipState);
    };

    return State;

  })();
});
