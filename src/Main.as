package {
	
	import components.MenuPlugin;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	import states.MenuState;

	/**
	 * ...
	 * @author GFM
	 */
	
	[SWF(width="500",height="500",backgroundColor="0x000000")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame {

		public function Main():void {
			FlxG.debug = true;
			super(250, 250, MenuState, 2, 60, 60);
			FlxG.addPlugin(new MenuPlugin);
		}
	}

}