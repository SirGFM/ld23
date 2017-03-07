package plugins {
	
	import basics.ClickableSprite;
	import org.flixel.FlxG;
	import states.MenuState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class MenuPlugin extends ClickableSprite {
		
		[Embed(source = "../../assets/gfx/menuButton.png")] private var gfx:Class;
		
		public function MenuPlugin(X:Number=0, Y:Number=0) {
			super(233, 1, gfx, 7, 7);
		}
		
		override protected function OnClick():void {
			FlxG.switchState(new MenuState());
		}
	}
}