define 

	background:
		color: 					'#fafafa'
		gridColor:				'#f5f5f5'
		borderColor:			'#ff0000'
	ship:
		color: 					'#555555'
		fillColor:				'#fafafa'
		engineColor:			'#ff6600'
		thrustRatio: 			0.4
		turnRatio: 				0.11
		exhaust:
			frequencyFactor: 	2
			disappearFactor:	25
			color:				'#dddddd'

	screen:
		height: 				0 # 700
		width: 					0 # 1000
		framesPerSecond: 		30
		panWhenWithin:			200
	
	game:
		height:					1000
		width:					1000	
		gravity:				0.15
		viscosity:				0.005
		keyCommandMap:
								37: 'left'
								90: 'left'
								39: 'right'
								67: 'right'
								38: 'thrust'
								83: 'thrust'
				
	