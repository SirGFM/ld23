package {
	
	import com.wordpress.gfmgamecorner.LogoGFM;
	import flash.events.Event;
	import plugins.MenuPlugin;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	import states.MenuState;
	import states.TestState;
	import utils.Sounds;

	/**
	 * ...
	 * @author GFM
	 */
	
	[SWF(width="500",height="500",backgroundColor="0x000000")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame {
		public function Main():void {
			FlxG.debug = true;
			//super(250, 250, TestState, 2, 60, 60);
			super(250, 250, MenuState, 2, 60, 60);
			Sounds.init();
			FlxG.addPlugin(new MenuPlugin);
		}
		
		private var logo:LogoGFM;
		override protected function create(FlashEvent:Event):void {
			if (!logo) {
				logo = new LogoGFM();
				logo.scaleX = 2;
				logo.scaleY = 2;
				logo.x = (500 - logo.width) / 2;
				logo.y = (500 - logo.height) / 2;
				addChild(logo);
				return;
			}
			else if (logo.visible)
				return;
			removeChild(logo);
			logo.destroy();
			logo = null;
			super.create(FlashEvent);
		}
		/*
		override protected function onFocus(FlashEvent:Event = null):void {
			super.onFocus(FlashEvent);
			Sounds.resumeSong();
		}
		
		override protected function onFocusLost(FlashEvent:Event = null):void {
			super.onFocusLost(FlashEvent);
			Sounds.pauseSong();
		}
		*/
	}

}