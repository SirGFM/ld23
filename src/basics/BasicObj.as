package basics {
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class BasicObj extends FlxSprite {
		
		public var size:Number;
		public var bad:Boolean;
		
		public function BasicObj(X:Number = 0, Y:Number = 0, Size:Number = 0, SimpleGraphic:Class = null, Bad:Boolean = false) {
			super(X, Y, SimpleGraphic);
			size = Size;
			bad = Bad;
			acceleration.y = 200;
		}
		
		override public function update():void {
			if (!onScreen()) {
				kill();
			}
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			resize(1 - size);
			flicker(0);
		}
		
		public function resize(incSize:Number = 1):void {
			size += incSize;
			scale.x += incSize;
			scale.y += incSize;
			width = frameWidth * scale.x;
			height = frameHeight * scale.y;
			//resetHelpers();
			//centerOffsets();
			var mod:int = ((incSize > 0)?0.5: -0.5);
			x -= (width - frameWidth) * mod;
			y -= (height - frameHeight) * mod;
			flicker(1);
		}
	}
}