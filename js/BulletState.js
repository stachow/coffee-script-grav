// Generated by CoffeeScript 1.4.0

define(function() {
  var BulletState;
  return BulletState = (function() {

    function BulletState(settings) {
      this.settings = settings;
      this.bullets = [];
      this.clock = 0;
    }

    BulletState.prototype.update = function(shipState) {
      var bullet, newBullets, _i, _j, _len, _len1, _ref, _ref1;
      _ref = this.bullets;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        bullet = _ref[_i];
        bullet[0] += Math.sin(bullet[2]) * this.settings.ship.bullet.speed;
        bullet[1] += -1 * Math.cos(bullet[2]) * this.settings.ship.bullet.speed;
      }
      newBullets = [];
      _ref1 = this.bullets;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        bullet = _ref1[_j];
        if (bullet[0] > 0 && bullet[0] < this.settings.game.width && bullet[1] > 0 && bullet[1] < this.settings.game.height) {
          newBullets.push(bullet);
        }
      }
      this.bullets = newBullets;
      if (shipState.shooting) {
        log(shipState.liveNosePoint()[0], shipState.liveNosePoint()[1]);
        return this.bullets.push([shipState.liveNosePoint()[0], shipState.liveNosePoint()[1], shipState.direction]);
      }
    };

    return BulletState;

  })();
});