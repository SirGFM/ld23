package components {
	
	import org.flixel.*;
	
	/**
	 * Simple horizontal bar for tracking some object's variable
	 * 
	 * @author GFM
	 */
	public class Bar extends FlxSprite {
		
		/**
		 * The contour of the bar
		 */
		private var border:FlxSprite;
		/**
		 * Helper for keeping track of when the variable has changed
		 */
		private var lastParam:Number;
		/**
		 * Name of object's variable
		 */
		private var param:String;
		/**
		 * Helper for checking if the max value has changed
		 */
		private var _maxParam:Number;
		/**
		 * Name of object's max value variable
		 */
		private var maxParamName:String;
		/**
		 * The object itself
		 */
		private var obj:Object;
		
		/**
		 * Initialize a new bar
		 * 
		 * @param	X	Bar's x (considering border)
		 * @param	Y	Bar's y (considering border)
		 * @param	W	Bar's width
		 * @param	H	Bar's height
		 * @param	COLOR	Bar's color (0xaarrggbb)
		 * @param	OBJ	Object which variable should be tracked
		 * @param	_param	Variable's name (must be public)
		 * @param	_maxParam	Max varible's name (must be public)
		 */
		public function Bar(X:Number, Y:Number, W:Number, H:Number, COLOR:uint, OBJ:Object, _param:String, __maxParam:String) {
			super(X + 1, Y + 1, null);
			makeGraphic(W, H, COLOR);
			obj = OBJ;
			param = _param;
			_maxParam = obj[__maxParam];
			maxParamName = __maxParam;
			calculateWidth();
			
			border = new FlxSprite(X, Y, null);
			border.makeGraphic(W + 2, H + 2, 0x00000000);
			
			border.drawLine(1, 1, W, H, 0xffcc3333);
			border.drawLine(0, 0, 0, H + 2, 0xffaaaaaa);
			border.drawLine(0, 0, W + 2, 0, 0xffaaaaaa);
			border.drawLine(0, H + 1, W + 2, H + 1, 0xffaaaaaa);
			border.drawLine(W + 1, 0, W + 1, H + 2, 0xffaaaaaa);
		}
		
		/**
		 * Called by game loop, updates then blits or renders current frame of animation to the screen
		 * Also, renders the border
		 */
		override public function draw():void {
			if (x != last.x) {
				border.x = x - 1;
			}
			if (y != last.y) {
				border.y = y-1;
			}
			border.draw();
			super.draw();
		}
		
		/**
		 * If needed, resizes the bar
		 */
		override public function update():void {
			if (_maxParam != obj[maxParamName]) {
				_maxParam = obj[maxParamName];
			}
			if (lastParam != obj[param]) {
				calculateWidth();
			}
			alpha -= 0.01;
			border.alpha -= 0.01;
			if (alpha <= 0) {
				kill();
			}
		}
		
		override public function kill():void {
			super.kill();
			border.kill();
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X + 1, Y + 1);
			border.reset(X, Y);
		}
		
		override public function revive():void {
			super.revive();
			border.revive();
			alpha = 1;
			border.alpha = 1;
		}
		
		/**
		 * Sets the bar position accordingly.
		 * 
		 * @param	X
		 * @param	Y
		 */
		public function setPosition(X:Number, Y:Number):void {
			x = X + 1;
			y = Y + 1;
			border.x = X;
			border.y = Y;
		}
		
		/**
		 * Helper function that makes the sprite as large as it should
		 */
		private function calculateWidth():void {
			lastParam = obj[param];
			frameWidth = width * lastParam / _maxParam;
			resetHelpers();
		}
		
		protected function get maxParam():Number {
			return _maxParam;
		}
	}

}