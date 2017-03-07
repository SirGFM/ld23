package components {
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import states.PlayState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class ResetPlugin extends FlxButton {
		
		[Embed(source = "../../assets/gfx/resetButton.png")] private var gfx:Class;
		
		public function ResetPlugin(X:Number=0, Y:Number=0, Label:String=null, OnClick:Function=null) {
			super(241, 1, "", click);
			loadGraphic(gfx, true, false, 7, 7);
		}
		
		override public function update():void {
			super.update();
			if (FlxG.keys.justPressed("R")) {
				if (FlxG.state is PlayState) {
					(FlxG.state as PlayState).setState(PlayState.curState);
				}
			}
		}
		
		private function click():void {
			if (FlxG.state is PlayState) {
				(FlxG.state as PlayState).setState(PlayState.curState);
			}
		}
	}

}