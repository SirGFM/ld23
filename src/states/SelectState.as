package states {
	
	import components.SelButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class SelectState extends FlxState {
		
		public function SelectState() {
			super();
		}
		
		override public function create():void {
			var i:int = 0;
			var j:int = 0;
			var arr:Array = [f0, f1, f2, f3, f4, f5, f6, f7, f8];
			while (i < 3) {
				j = 0;
				while (j < 3) {
					if((i+j*3 != 7 )&&( i+j*3 != 8)){
						add(new SelButton(85 + i * 30,  85 + j * 30, int(1 + i + j * 3).toString(), arr[i + j * 3]as Function));
					}
					j++;
				}
				i++;
			}
		}
		
		public function f0():void {
			FlxG.switchState(new PlayState(0));
			FlxG.flash();
		}
		
		public function f1():void {
			FlxG.switchState(new PlayState(1));
			FlxG.flash();
		}
		
		public function f2():void {
			FlxG.switchState(new PlayState(2));
			FlxG.flash();
		}
		
		public function f3():void {
			FlxG.switchState(new PlayState(3));
			FlxG.flash();
		}
		
		public function f4():void {
			FlxG.switchState(new PlayState(4));
			FlxG.flash();
		}
		
		public function f5():void {
			FlxG.switchState(new PlayState(5));
			FlxG.flash();
		}
		
		public function f6():void {
			FlxG.switchState(new PlayState(6));
			FlxG.flash();
		}
		
		public function f7():void {
			FlxG.switchState(new PlayState(7));
			FlxG.flash();
		}
		
		public function f8():void {
			FlxG.switchState(new PlayState(8));
			FlxG.flash();
		}
	}

}