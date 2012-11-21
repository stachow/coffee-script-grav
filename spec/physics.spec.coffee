define ['../js/rotationTranslator'], 
(rotationTranslator) ->
	describe "The translator",  ->
		it "should return the string", ->
			expect(rotationTranslator(".")).toEqual("..")
		