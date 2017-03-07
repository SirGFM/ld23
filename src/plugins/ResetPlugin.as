package plugins {
	
	import basics.ClickableSprite;
	import org.flixel.FlxG;
	import states.PlayState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class ResetPlugin extends ClickableSprite {
		
		[Embed(source = "../../assets/gfx/resetButton.png")] private var gfx:Class;
		
		public function ResetPlugin(X:Number=0, Y:Number=0) {
			super(241, 1, gfx, 7, 7);
		}
		
		override public function update():void {
			super.update();
			if (FlxG.keys.justPressed("R")) {
				if (FlxG.state is PlayState) {
					(FlxG.state as PlayState).setState(PlayState.curState);
				}
			}
		}
		
		override protected function OnClick():void {
			if (FlxG.state is PlayState) {
				(FlxG.state as PlayState).setState(PlayState.curState);
			}
		}
	}
}