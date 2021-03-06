// Generated by CoffeeScript 1.4.0

define(function() {
  var ExhaustState;
  return ExhaustState = (function() {

    function ExhaustState(settings) {
      this.settings = settings;
      this.puffs = [];
      this.clock = 0;
    }

    ExhaustState.prototype.update = function(shipState) {
      var puff, _i, _len, _ref;
      _ref = this.puffs;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        puff = _ref[_i];
        puff[0] += 1;
        if (puff[0] >= this.settings.ship.exhaust.disappearFactor) {
          this.puffs = this.puffs.slice(1);
        }
      }
      this.clock += 1;
      if (this.clock >= this.settings.ship.exhaust.frequencyFactor) {
        this.clock = 0;
        if (shipState.thrusting) {
          return this.puffs.push([0, shipState.liveEnginePoint()[0], shipState.liveEnginePoint()[1]]);
        }
      }
    };

    return ExhaustState;

  })();
});
