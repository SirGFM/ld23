package components {
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import states.PlayState;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class NextStageMenu extends FlxGroup {
		
		public function NextStageMenu(MaxSize:uint=0) {
			super(MaxSize);
			// TODO return to menu button
			// TODO return to level select button
			// TODO next level button
			var tmp:FlxSprite;
			tmp = new FlxSprite();
			tmp.makeGraphic(250, 250, 0xaaaaaaaa);
			add(tmp);
		}
		
		override public function update():void {
			super.update();
			if (FlxG.keys.ENTER) {
				kill();
				(FlxG.state as PlayState).setState(PlayState.curState);
			}
		}
	}
}