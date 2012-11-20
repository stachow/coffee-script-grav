// Generated by CoffeeScript 1.4.0

define(['rendererBackground', 'rendererShip', 'rendererExhaust'], function(rendererBackground, rendererShip, rendererExhaust) {
  return function(ctx, settings, state) {
    rendererBackground(ctx, settings, state);
    rendererExhaust(ctx, settings, state);
    rendererShip(ctx, settings, state);
    ctx.translate(-state.screenState.nextShiftX, -state.screenState.nextShiftY);
  };
});
