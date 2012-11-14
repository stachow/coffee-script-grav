// Generated by CoffeeScript 1.4.0
var screen;

screen = {
  init: function(el) {
    var ctx, h, point, w, _i, _len, _ref;
    ctx = el.getContext("2d");
    h = el.height;
    w = el.width;
    ctx.beginPath;
    _ref = [[w, 0], [w, h], [0, h], [0, 0]];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      point = _ref[_i];
      ctx.lineTo(point[0], point[1]);
    }
    ctx.closePath;
    ctx.fillStyle = '#eeeeee';
    ctx.fill();
    console.log("Hello from screen init");
  }
};
