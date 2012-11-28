define ['shape/baseShape', 'logic/Translator'],
	(baseShape, Translator)->
			class BaseState
				constructor: (@settings) ->
					@position = [0, 0]
					@translator = new Translator

				livePoints: () =>
					
					(@translator.translate point, @position for point in baseShape.points)

				externalBoxPoints: () =>
					@translator.externalLimits @livePoints()