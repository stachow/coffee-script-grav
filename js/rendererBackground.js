// Generated by CoffeeScript 1.4.0

define(function() {
  return function(ctx, settings, state) {
    var h, i, w, _i, _j;
    ctx.save();
    h = settings.game.height;
    w = settings.game.width;
    ctx.clearRect(0, 0, w, h);
    ctx.fillStyle = settings.background.color;
    ctx.fillRect(0, 0, w, h);
    ctx.strokeStyle = settings.background.gridColor;
    for (i = _i = 0.5; _i <= w; i = _i += 100) {
      ctx.beginPath();
      ctx.moveTo(i, 0);
      ctx.lineTo(i, h);
      ctx.stroke();
    }
    for (i = _j = 0.5; _j <= h; i = _j += 100) {
      ctx.beginPath();
      ctx.moveTo(0, i);
      ctx.lineTo(w, i);
      ctx.stroke();
    }
    ctx.strokeStyle = settings.background.borderColor;
    h = settings.game.height;
    w = settings.game.width;
    ctx.beginPath();
    ctx.moveTo(0, 0);
    ctx.lineTo(0, h);
    ctx.stroke();
    ctx.lineTo(w, h);
    ctx.stroke();
    ctx.lineTo(w, 0);
    ctx.stroke();
    ctx.lineTo(0, 0);
    ctx.stroke();
    ctx.restore();
  };
});
