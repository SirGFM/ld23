package basics {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class ClickableSprite extends FlxSprite {
		
		protected const DEFAULT:uint = 0x0000;
		protected const HOVER:uint = 0x0001;
		protected const PRESSED:uint = 0x0002;
		
		private var _state:uint;
		
		public function ClickableSprite(X:Number=0, Y:Number=0, Graphic:Class = null, Width:uint = 0, Height:uint = 0) {
			super(X, Y);
			loadGraphic(Graphic, true, false, Width, Height);
			state = DEFAULT;
		}
		
		override public function update():void {
			if (FlxG.mouse.justReleased() && (_state == PRESSED)) {
				OnClick();
				state = DEFAULT;
			}
			if (pixelsOverlapPoint(FlxG.mouse)) {
				if (FlxG.mouse.justPressed()) {
					state = PRESSED;
				}
				else if(_state == DEFAULT) {
					state = HOVER;
				}
			}
			else if (frame != DEFAULT) {
				state = DEFAULT;
			}
		}
		
		private function set state(val:uint):void {
			_state = val;
			frame = val;
		}
		
		protected function OnClick():void {
			
		}
	}
}