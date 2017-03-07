package states {
	
	import org.flixel.FlxButton;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import utils.Sounds;
	import utils.Stages;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class MenuState extends FlxState {
		
		[Embed(source = "../../assets/gfx/bigHummy.png")] private var bigHummy:Class;
		[Embed(source = "../../assets/gfx/smallTile.png")] private var tile:Class;
		
		public function MenuState() {
			super();
		}
		
		override public function create():void {
			Sounds.playMainSong();
			FlxG.bgColor = 0xff1033bb;
			FlxG.mouse.show();
			var tmp:FlxTilemap = new FlxTilemap();
			tmp.loadMap(Stages.menu(), tile, 8, 8);
			add(tmp);
			add(new FlxSprite(20, 155, bigHummy));
			add(new FlxButton(135, 174, "Start Game", function():void { FlxG.switchState(new SelectState()); } ));
			//add(new FlxButton(155, 199, "Credits", function():void { FlxG.switchState(new CreditsState()) ; } ));
		}
		
	}

}