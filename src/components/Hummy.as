package components {
	import basics.BasicObj;
	import basics.Player;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Hummy extends Player {
		
		[Embed(source = "../../assets/gfx/p01.png")] private var gfx01:Class;
		
		public function Hummy(X:Number=0, Y:Number=0, Velo:FlxPoint=null) {
			super(X, Y, 1, Velo);
			loadGraphic(gfx01, true, true, 8, 8);
			addAnimation("def", [0], 0, false);
			addAnimation("eat", [3], 0, false);
			addAnimation("walk", [1, 0, 2, 0], 4, true);
			addAnimation("jump", [1], 0, false);
		}
		
		override public function update():void {
			super.update();
			
			if (_eat > 0) {
				//eat animation gets priority
			}
			else if (jump) {
				play("jump");
			}
			else if ((control.left || control.right) && (touching & DOWN)) {
				play("walk");
			}
			else {
				play("def");
			}
		}
		
		override public function eat(obj:BasicObj):Boolean {
			var ret:Boolean = super.eat(obj);
			if (ret == true) {
				_eat = 30;
				play("eat");
			}
			return ret;
		}
	}
}