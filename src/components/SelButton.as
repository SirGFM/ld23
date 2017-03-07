package components {
	import org.flixel.FlxButton;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class SelButton extends FlxButton {
		
		[Embed(source = "../../assets/gfx/button.png")] private var gfx:Class;
		
		public function SelButton(X:Number = 0, Y:Number = 0, Label:String = null, OnClick:Function = null) {
			super(X, Y, Label, OnClick);
			loadGraphic(gfx, true, false, 20, 20);
		}
		
	}

}