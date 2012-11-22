define ['baseShape', 'collisionDetect'],
	(baseShape, collisionDetect)->
			class BaseState
				constructor: (@settings) ->
					@position = [0, 0]
				livePoints: () =>
					baseShape.points

				externalBoxPoints: () =>
					collisionDetect.externalLimits @livePoints()