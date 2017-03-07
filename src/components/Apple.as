package components {
	
	import basics.BasicObj;
	import utils.Sounds;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Apple extends BasicObj {
		
		[Embed(source = "../../assets/gfx/apple.png")] private var gfx:Class;
		
		public function Apple(X:Number=0, Y:Number=0) {
			super(X, Y, 0.5, gfx);
			acceleration.y = 0;
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			resize(-0.5);
		}
		
		override public function kill():void {
			super.kill();
			if (health > 0) {
				Sounds.playCollect();
			}
		}
	}

}