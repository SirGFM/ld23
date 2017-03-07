package basics {
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import utils.Control;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Player extends BasicObj {
		
		[Embed(source = "../../assets/jump.mp3")] private var sfx:Class;
		
		private var _control:Control;
		protected var velo:FlxPoint;
		protected var _eat:int;
		protected var jump:Boolean;
		
		public function Player(X:Number = 0, Y:Number = 0, Size:Number = 0, Velo:FlxPoint = null) {
			super(X, Y, Size);
			_control = new Control();
			if (Velo == null) {
				Velo = new FlxPoint();
			}
			velo = Velo;
			// TODO add gravity
			maxVelocity.x = velo.x;
			maxVelocity.y = velo.y;
			drag.x = 100;
			_eat = 0;
			jump = false;
		}
		
		override public function update():void {
			super.update();
			_eat--;
			if (touching & DOWN) {
				jump = false;
			}
			if (_control.up) {
				if (touching & DOWN) {
					jump = true;
					FlxG.loadSound(sfx, 1.0, false, false, true);
					velocity.y = -velo.y;
				}
			}
			if (_control.left) {
				//velocity.x = -velo.x;
				acceleration.x = -velo.x;
				facing = LEFT;
			}
			else if (_control.right) {
				//velocity.x = velo.x;
				acceleration.x = velo.x;
				facing = RIGHT;
			}
			else {
				acceleration.x = 0;
			}
		}
		
		public function get eat():Boolean {
			return (_eat > 0);
		}
		
		public function get control():Control {
			return _control;
		}
	}

}