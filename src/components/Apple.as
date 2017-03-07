package components {
	import basics.BasicObj;
	
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
		
	}

}