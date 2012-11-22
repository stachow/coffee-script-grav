define ['baseShape', 'collisionDetect'],
	(baseShape, collisionDetect)->
			class BaseState
				constructor: (@settings) ->
					@positionX = 0
					@positionY = 0

				livePoints: () =>
					baseShape.points

				externalBoxPoints: () =>
					collisionDetect.externalLimits @livePoints()