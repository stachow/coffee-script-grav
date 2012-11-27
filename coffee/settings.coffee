define 

	background:
		color: 						'#fafafa'
		gridColor:					'#ffffff'
		borderColor:				'red'
		borderColorAlert:			'green'
	ship:
		color: 						'#555555'
		fillColor:					'#fafafa'
		engineColor:				'#ff6600'
		thrustRatio: 				0.4
		turnRatio: 					0.11
		exhaust:
			frequencyFactor: 		2
			disappearFactor:		25
			color:					'#cccccc'
		landing:
			maxDownwardSpeed:		1.5
			maxSidewardSpeed:		0.5
			maxAngleFromVertical:	Math.pi/16
		bullet:
			speed:					10
			color:					'#111111'

	screen:
		height: 					0 # 700
		width: 						0 # 1000
		framesPerSecond: 			30
		panWhenWithin:				300
	
	game:
		height:						1000
		width:						1500	
		gravity:					0.15
		viscosity:					0.005
		keyCommandMap:
									37: 'left'
									90: 'left'
									39: 'right'
									67: 'right'
									38: 'thrust'
									83: 'thrust'
									27: 'stop'
									32: 'shoot'
									17: 'shoot'
	base:
		color:						'white'
		colorLanded:				'green'
		colorCrashed:				'red'			
	