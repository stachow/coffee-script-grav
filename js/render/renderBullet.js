// Generated by CoffeeScript 1.4.0

define(function() {
  return function(ctx, settings, state) {
    var bullet, _i, _len, _ref;
    ctx.save();
    ctx.fillStyle = settings.ship.bullet.color;
    _ref = state.bulletState.bullets;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      bullet = _ref[_i];
      ctx.fillRect(bullet[0] - 1, bullet[1] - 1, 2, 2);
    }
    ctx.restore();
  };
});
