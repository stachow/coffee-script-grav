// Generated by CoffeeScript 1.4.0

define(['settings'], function(settings) {
  return {
    externalLimits: function(points) {
      var maxX, maxY, minX, minY, point, pointZero, _i, _len, _ref;
      pointZero = points[0];
      minX = maxX = pointZero[0];
      minY = maxY = pointZero[1];
      _ref = points.slice(1);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        point = _ref[_i];
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
      var theyDoCollide;
      theyDoCollide = shapeExternals1[0][0] < shapeExternals2[1][0] && shapeExternals1[1][0] > shapeExternals2[0][0] && shapeExternals1[0][1] < shapeExternals2[1][1] && shapeExternals1[1][1] > shapeExternals2[0][1];
      return theyDoCollide;
    },
    landedSafely: function(shipState, baseState) {
      var _ref;
      if (!((settings.ship.landing.maxDownwardSpeed >= (_ref = shipState.velocity[1]) && _ref >= 0))) {
        log('Speed too much or upwards');
        return false;
      }
      if (Math.abs(shipState.velocity[0]) >= settings.ship.landing.maxSidewardSpeed) {
        log('Sidewards speed too much');
        return false;
      }
      if (shipState.direction <= 2 * Math.pi - settings.ship.landing.maxAngleFromVertical && shipState.direction >= settings.ship.landing.maxAngleFromVertical) {
        log('Angle too much');
        return false;
      }
      if (shipState.externalBoxPoints()[0][0] < baseState.externalBoxPoints()[0][0] || shipState.externalBoxPoints()[1][0] > baseState.externalBoxPoints()[1][0]) {
        log('Off the edge');
        return false;
      }
      return true;
    }
  };
});
