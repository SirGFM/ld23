package basics {
	import org.flixel.FlxObject;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Eater extends BasicObj {
		
		protected var _eat:int;
		protected var cantStomp:Boolean;
		protected var cantEat:Boolean;
		
		public function Eater(X:Number = 0, Y:Number = 0, Size:Number = 0, SimpleGraphic:Class = null, MaxHealth:Number = 1, Gravity:Boolean = true, Bad:Boolean = false, CantStomp:Boolean = false, CantEat:Boolean = false, AutoCenter:Boolean = false) {
			super(X, Y, Size, SimpleGraphic, MaxHealth, Gravity, Bad, AutoCenter);
			_eat = 0;
			cantStomp = CantStomp;
			cantEat = CantEat;
		}
		
		override public function update():void {
			super.update();
			_eat--;
		}
		
		public function stomp(obj:BasicObj):Boolean {
			if (obj.flickering || cantStomp) {
				return false;
			}
			if (((y + height - 2) <= obj.y) && (velocity.y >= 0)) {
				obj.hurt(size / ((obj.size > 1)?(obj.size):(1)) / 10);
				return true;
			}
			return false;
		}
		
		public function eat(obj:BasicObj):Boolean {
			var tmp:Number;
			if (obj.flickering || cantEat) {
				return false;
			}
			//if ( (_eat > 0) && (size >= obj.size) && (((x < obj.x) && (facing == RIGHT)) || ((x > obj.x) && (facing == LEFT))) ){
			if ((size >= obj.size) && (((x < obj.x) && (facing == RIGHT)) || ((x > obj.x) && (facing == LEFT))) ) {
				hurt(-obj.size / 10);
				obj.kill();
				return true;
			}
			else if (obj.bad) {
				tmp = obj.size / ((size > 1)?(size):(1)) / 10;
				hurt(tmp);
			}
			return false;
		}
	}
}