package components {
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import states.MenuState;
	import states.PlayState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class MenuPlugin extends FlxButton {
		
		[Embed(source = "../../assets/gfx/menuButton.png")] private var gfx:Class;
		
		public function MenuPlugin(X:Number=0, Y:Number=0, Label:String=null, OnClick:Function=null) {
			super(233, 1, Label, click);
			loadGraphic(gfx, true, false, 7, 7);
		}
		
		private function click():void {
			FlxG.switchState(new MenuState());
		}
	}

}