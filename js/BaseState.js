// Generated by CoffeeScript 1.4.0
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(['baseShape', 'collisionDetect'], function(baseShape, collisionDetect) {
  var BaseState;
  return BaseState = (function() {

    function BaseState(settings) {
      this.settings = settings;
      this.externalBoxPoints = __bind(this.externalBoxPoints, this);

      this.livePoints = __bind(this.livePoints, this);

      this.positionX = 0;
      this.positionY = 0;
    }

    BaseState.prototype.livePoints = function() {
      return baseShape.points;
    };

    BaseState.prototype.externalBoxPoints = function() {
      return collisionDetect.externalLimits(this.livePoints());
    };

    return BaseState;

  })();
});
