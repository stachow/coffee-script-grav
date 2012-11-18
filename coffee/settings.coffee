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
		turnRatio: 				0.1
		exhaust:
			frequencyFactor: 	4
			disappearFactor:	25
			color:				'#eeeeee'

	screen:
		height: 				0 # 700
		width: 					0 # 1000
		framesPerSecond: 		30
	
	game:
		height:					5000
		width:					5000	
		gravity:				0.15
		viscosity:				0.005
		keyCommandMap:
								37: 'left'
								90: 'left'
								39: 'right'
								67: 'right'
								38: 'thrust'
								83: 'thrust'
				
	