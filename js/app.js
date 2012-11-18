// Generated by CoffeeScript 1.4.0

window.log = function() {
  log.history = log.history || [];
  log.history.push(arguments);
  if (this.console) {
    console.log(Array.prototype.slice.call(arguments));
  }
};

require(['settings', 'renderer', 'State', 'Commands', 'browser'], function(settings, renderer, State, Commands, browser) {
  var canvas, commands, ctx, gameLoopId, state, _ref;
  canvas = browser.getCanvas('gameScreen');
  _ref = [canvas.getContext('2d'), canvas.width, canvas.height], ctx = _ref[0], settings.screen.width = _ref[1], settings.screen.height = _ref[2];
  commands = new Commands(settings);
  browser.bindCommands(commands);
  state = new State(settings);
  state.shipState.positionX = settings.screen.width / 2;
  state.shipState.positionY = 20;
  gameLoopId = setInterval(function() {
    state.update(commands);
    return renderer(ctx, settings, state);
  }, 1000 / settings.screen.framesPerSecond);
});
