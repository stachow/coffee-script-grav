define ['./shipState'], 
	(ShipState) ->
		class State
			constructor: (settings) ->
				@shipState = new ShipState settings
