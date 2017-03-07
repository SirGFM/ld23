package components {
	import basics.BasicObj;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Yummy extends BasicObj {
		
		[Embed(source = "../../assets/gfx/cake.png")] private var cake:Class;
		
		public function Yummy(X:Number=0, Y:Number=0, Size:Number=1) {
			super(X, Y, 1);
			loadGraphic(cake);
			if (Size > 1) {
				resize(Size - size);
			}
		}
		
	}

}