package components.enemies {
	
	import basics.BasicObj;
	
	/**
	 * Walks on the direction it's facing until it hits a wall. Then, it switch direction.
	 * 
	 * @author GFM
	 */
	public class Dummy extends BasicObj {
		
		[Embed(source = "../../../assets/gfx/working/ene01_1.png")] private var gfx1:Class;
		[Embed(source = "../../../assets/gfx/working/ene01_2.png")] private var gfx2:Class;
		
		public function Dummy(X:Number=0, Y:Number=0, Size:Number=0) {
			super(X, Y, Size, null, 1, true, true);
			loadGraphic(gfx1, true, true, 8, 8);
			addAnimation("def", [0, 7, 6, 5, 4, 3, 2, 1], 8);
			play("def");
			facing = RIGHT;
			velocity.x = 100;
		}
		
		override public function update():void {
			super.update();
			if (touching & LEFT) {
				facing = RIGHT;
				velocity.x = 100;
			}
			else if (touching & RIGHT) {
				facing = LEFT;
				velocity.x = -100;
			}
		}
		
	}

}