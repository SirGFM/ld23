package basics {
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import utils.Control;
	import utils.Sounds;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Player extends Eater {
		
		private var _control:Control;
		protected var velo:FlxPoint;
		protected var jump:Boolean;
		
		public function Player(X:Number = 0, Y:Number = 0, Size:Number = 0, Velo:FlxPoint = null) {
			super(X, Y, Size, null, 10, true, false, false, false, true);
			_control = new Control();
			if (Velo == null) {
				Velo = new FlxPoint();
			}
			velo = Velo;
			maxVelocity.x = velo.x;
			maxVelocity.y = velo.y;
			drag.x = 250;
			_eat = 0;
			jump = false;
		}
		
		override public function update():void {
			super.update();
			if (touching & DOWN) {
				jump = false;
			}
			if (_control.up) {
				if (touching & DOWN) {
					jump = true;
					Sounds.playJump();
					velocity.y = -velo.y;
				}
			}
			if (_control.left) {
				acceleration.x = -velo.x;
				facing = LEFT;
			}
			else if (_control.right) {
				acceleration.x = velo.x;
				facing = RIGHT;
			}
			else {
				acceleration.x = 0;
			}
		}
		
		public function get control():Control {
			return _control;
		}
	}
}