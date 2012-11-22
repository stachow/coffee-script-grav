// Generated by CoffeeScript 1.4.0

define(function() {
  return {
    landed: function(shipState, baseState) {
      return false;
    },
    externalLimits: function(points) {
      var maxX, maxY, minX, minY, point, _i, _len;
      minX = maxX = minY = maxY = 0;
      for (_i = 0, _len = points.length; _i < _len; _i++) {
        point = points[_i];
        if (point[0] < minX) {
          minX = point[0];
        }
        if (point[0] > maxX) {
          maxX = point[0];
        }
        if (point[1] < minY) {
          minY = point[1];
        }
        if (point[1] > maxY) {
          maxY = point[1];
        }
      }
      return [[minX, minY], [maxX, maxY]];
    },
    rectanglesCollide: function(shapeExternals1, shapeExternals2) {
      return shapeExternals1[0][0] < shapeExternals2[1][0] && shapeExternals1[1][0] > shapeExternals2[0][0] && shapeExternals1[0][1] < shapeExternals2[1][1] && shapeExternals1[1][1] > shapeExternals2[0][1];
    }
  };
});
