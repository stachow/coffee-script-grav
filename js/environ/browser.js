// Generated by CoffeeScript 1.4.0

define(function() {
  return {
    getCanvas: function(id) {
      return window.document.getElementById(id);
    },
    bindCommands: function(commands) {
      window.document.onkeydown = commands.keyDownHandler;
      return window.document.onkeyup = commands.keyUpHandler;
    }
  };
});
