package components {
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
			
			if (jump) {
				play("jump");
			}
			else if ((control.left || control.right) && (touching & DOWN)) {
				play("walk");
			}
			else if (!control.left && !control.right && (velocity.y <= 0) && control.j_action) {
				_eat = 30;
				play("eat");
			}
			else if (!eat) {
				play("def");
			}
		}
		
	}

}