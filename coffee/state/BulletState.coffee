define ->
	class BulletState
			constructor: (@settings) ->
				@bullets = []
				@clock = 0

			update: (shipState)->
				for bullet in @bullets
					bullet[0] += Math.sin(bullet[2]) * @settings.ship.bullet.speed 
					bullet[1] += -1 * Math.cos(bullet[2]) * @settings.ship.bullet.speed 
				
				newBullets = []
				for bullet in @bullets	
					if 	bullet[0] > 0 and bullet[0] < @settings.game.width and bullet[1] > 0 and bullet[1] < @settings.game.height
						newBullets.push bullet 			
				@bullets = newBullets		


				if shipState.shooting
					log shipState.liveNosePoint()[0], shipState.liveNosePoint()[1]
					@bullets.push [
									shipState.liveNosePoint()[0], 
									shipState.liveNosePoint()[1],
									shipState.direction
								]



