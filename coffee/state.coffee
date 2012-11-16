define ['./shipState', './StateKey'], 
	(ShipState, StateKey) ->
		class State
			constructor: (settings) ->
				@shipState 	= new ShipState settings
				@keyState 	= new StateKey  settings

			update: ->
				@shipState.changeDirection @keyState.currentCommand()
				return