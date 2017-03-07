package components.enemies {
	
	import basics.Eater;
	import states.PlayState;
	
	// TODO Squasher: adjust parameter
	//		downed time
	//		up speed
	//		falling velocity
	
	/**
	 * Stands at the roof and, when the player is close, drops to the ground.
	 * 
	 * @author GFM
	 */
	public class Squasher extends Eater {
		
		private var time = 0;
		
		public function Squasher(X:Number = 0, Y:Number = 0) {
			super(X, Y, size, null, 1, true, true, false, true);
			moves = false;
			facing = DOWN;
		}
		
		override public function update():void {
			super.update();
			if (justTouched(UP)) {
				// TODO play standBy animation
			}
			else if (touching & UP) {
				if (PlayState.self.playerDirection(this) & DOWN) {
					if (PlayState.self.playerHorDistance(this) < 24) {
						moves = true;
						time = 90;
						// TODO play falling animation
					}
				}
			}
			else if (touching & DOWN) {
				if (time == 0) {
					velocity.y = -180;
					// TODO play goingUp animation
				}
				else {
					time--;
				}
			}
		}
	}
}