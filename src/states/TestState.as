package states {
	
	import basics.Eater;
	import components.Apple;
	import components.enemies.Dummy;
	import components.Hummy;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class TestState extends FlxState {
		
		[Embed(source = "../../assets/stages/stage01.txt", mimeType = "application/octet-stream")] private var stage:Class;
		
		public var left:Boolean;
		public var right:Boolean;
		
		public var tl:FlxTilemap;
		public var pl:Eater;
		public var o:FlxObject;
		public var fl:FlxSprite;
		
		public function TestState() {
			
		}
		
		override public function create():void {
			tl = new FlxTilemap();
			tl.loadMap(new stage, FlxTilemap.ImgAuto, 8, 8, FlxTilemap.AUTO, 0, 1, 1);
			add(tl);
			o = new Apple(100, 100);
			o.allowCollisions = FlxObject.NONE;
			add(o);
			pl = new Hummy(50, 90, new FlxPoint(75, 100));
			add(pl);
			add(new Dummy(50, 50, 1));
			//fl = new FlxSprite(0, 109);
			//fl.makeGraphic(250, 10);
			//fl.immovable = true;
			//add(fl);
			FlxG.watch(pl, "x");
			FlxG.watch(pl, "y");
			FlxG.watch(pl, "width");
			FlxG.watch(pl, "height");
			FlxG.watch(pl, "size");
		}
		
		override public function update():void {
			if (FlxG.keys.justPressed("Z")) {
				pl.resize(0.1);
			}
			if (FlxG.keys.justPressed("X")) {
				pl.resize(-0.1);
			}
			FlxG.collide(this);
			super.update();
		}
	}
}