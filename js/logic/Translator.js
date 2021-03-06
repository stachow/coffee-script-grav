// Generated by CoffeeScript 1.4.0
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(function() {
  var Translator;
  return Translator = (function() {

    function Translator() {
      this.translatePoints = __bind(this.translatePoints, this);

      this.translate = __bind(this.translate, this);

    }

    Translator.prototype.rotate = function(x, y, rads) {
      return [Math.cos(-rads) * x + Math.sin(-rads) * y, -Math.sin(-rads) * x + Math.cos(-rads) * y];
    };

    Translator.prototype.translate = function(point, coordinates) {
      return [point[0] + coordinates[0], point[1] + coordinates[1]];
    };

    Translator.prototype.translatePoints = function(points, coordinates) {
      var point, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = points.length; _i < _len; _i++) {
        point = points[_i];
        _results.push(this.translate(point, coordinates));
      }
      return _results;
    };

    Translator.prototype.externalLimits = function(points) {
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
    };

    return Translator;

  })();
});
