define ['baseShape', 'Translator', 'collisionDetect'],
	(baseShape, Translator, collisionDetect)->
			class BaseState
				constructor: (@settings) ->
					@position = [0, 0]
				
				livePoints: () =>
					translator = new Translator
					(translator.translate point, @position for point in baseShape.points)

				externalBoxPoints: () =>
					collisionDetect.externalLimits @livePoints()