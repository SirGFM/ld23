package states {
	
	import basics.BasicObj;
	import basics.Player;
	import components.Apple;
	import components.Hummy;
	import components.NextStageMenu;
	import components.Yummy;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	import plugins.ResetPlugin;
	import utils.Stages;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class PlayState extends FlxState {
		
		[Embed(source = "../../assets/gfx/smallTile.png")] private var tile01:Class;
		[Embed(source = "../../assets/gfx/autotile.png")] private var tile02:Class;
		
		static public var curState:uint = 0;
		static public var win:Boolean = true;
		static public var self:PlayState;
		
		private var player:Player;
		private var yummy:Yummy;
		private var world:FlxTilemap;
		private var mob:FlxGroup;
		private var text:FlxText;
		
		private var next:NextStageMenu;
		private var objects:FlxGroup;
		private var tmpPoint01:FlxPoint;
		private var tmpPoint02:FlxPoint;
		
		public function PlayState(n:uint = 0) {
			objects = new FlxGroup();
			mob = new FlxGroup();
			world = new FlxTilemap();
			text = new FlxText(20, 40, 210, "");
			yummy = new Yummy();
			next = new NextStageMenu();
			next.kill();
			curState = n;
			tmpPoint01 = new FlxPoint();
			tmpPoint02 = new FlxPoint();
			self = this;
			FlxG.addPlugin(new ResetPlugin());
		}
		
		override public function destroy():void {
			super.destroy();
			objects = null;
			tmpPoint01 = null;
			tmpPoint02 = null;
			self = null;
			FlxG.removePluginType(ResetPlugin);
		}
		
		override public function create():void {
			FlxG.bgColor = 0xff1033bb;
			player = new Hummy(50, 50, new FlxPoint(100, 115));
			objects.add(player);
			objects.add(mob);
			setState(curState);
			//world.loadMap(createStage(curState), tile01, 8, 8);
			add(world);
			add(mob);
			add(player);
			add(text);
			mob.add(yummy);
			FlxG.watch(player, "size");
		}
		
		override public function draw():void {
			super.draw();
			if (next.alive) {
				next.draw();
			}
		}
		
		override public function update():void {
			if (next.alive) {
				//next.update();
				setState(curState);
				next.kill();
				return;
			}
			FlxG.collide(objects, world, worldCol);
			FlxG.overlap(player, mob, mobCol);
			super.update();
			if (!player.alive) {
				win = false;
				next.revive();
			}
			else if (!yummy.alive) {
				curState++;
				win = true;
				next.revive();
			}
		}
		
		private function worldCol(obj:BasicObj, w:FlxTilemap):void {
			// TODO enable eating the world
		}
		
		private function mobCol(pl:Player, mob:BasicObj):void {
			var tmp:Number;
			// using sudden death to execute 3 if statements inside one =D
			// TODO remove stomp?
			if(!pl.eat(mob) && !pl.stomp(mob) && mob.bad && !mob.flickering) {
				tmp = mob.size / ((pl.size > 1)?(pl.size):(1)) / 10;
				pl.hurt(tmp);
				//pl.resize( -tmp);
				if (pl.size <= 0) {
					pl.kill();
				}
			}
		}
		
		public function playerDirection(obj:FlxObject):uint {
			var ret:uint = 0;
			if (obj.y > player.y) {
				ret += FlxObject.UP;
			}
			else {
				ret += FlxObject.DOWN;
			}
			if (obj.x > player.x) {
				ret += FlxObject.RIGHT;
			}
			else {
				ret += FlxObject.LEFT;
			}
			return ret;
		}
		
		public function playerDistance(obj:FlxObject):Number {
			return FlxU.getDistance(player.getMidpoint(tmpPoint01), obj.getMidpoint(tmpPoint02));
		}
		
		public function playerHorDistance(obj:FlxObject):Number {
			return FlxU.abs(player.x - obj.x);
		}
		
		public function setState(n:uint = 0):void {
			mob.callAll("kill");
			//world.loadMap(createStage(n), tile01, 8, 8);
			world.loadMap(createStage(n), tile02, 8, 8, FlxTilemap.AUTO);
			world.setDirty();
		}
		
		private function createStage(n:uint = 0):String {
			player.reset(16, 200);
			switch(n) {
				case 0: {
					text.text = "I'm hungry!\nDo I see yummies over there?\nI'll move there using the arrow keys!\nThen I'll eat the yummies with the spacebar";
					yummy.reset(216, 208);
					return Stages.stage01();
				}break;
				case 1: {
					text.text = "Oh no! Yummy is high. >_<\n Lucky me, since I can press up to jump";
					yummy.reset(216, 176);
					return Stages.stage02();
				}break;
				case 2: {
					text.text = "This time, yummy is to big...\n But I can eat to get bigger!";
					(mob.recycle(Apple) as Apple).reset(48, 208);
					(mob.recycle(Apple) as Apple).reset(72, 208);
					(mob.recycle(Apple) as Apple).reset(96, 208);
					(mob.recycle(Apple) as Apple).reset(120, 208);
					(mob.recycle(Apple) as Apple).reset(144, 208);
					(mob.recycle(Apple) as Apple).reset(168, 208);
					yummy.reset(216, 208);
					yummy.resize(0.3);
					return Stages.stage03();
				}break;
				case 3: {
					//no shit, sherlock!
					text.text = "Pits are bad! They kill anything that fall into it...";
					yummy.reset(216, 208);
					return Stages.stage04();
				}
				case 4: {
					text.text = "Noooo.\nYummy is to big, even if I get bigger...\n I'll jump over it so it shrinks!!";
					(mob.recycle(Apple) as Apple).reset(56, 160);
					(mob.recycle(Apple) as Apple).reset(80, 160);
					(mob.recycle(Apple) as Apple).reset(168, 160);
					(mob.recycle(Apple) as Apple).reset(192, 160);
					(mob.recycle(Apple) as Apple).reset(112, 208);
					(mob.recycle(Apple) as Apple).reset(136, 208);
					yummy.reset(216, 200);
					yummy.resize(1);
					return Stages.stage05();
				}break;
				case 5: {
					text.text = "Yummy enemies!\n Must be careful not to get hurt...";
					
					(mob.recycle(Apple) as Apple).reset(128, 96);
					(mob.recycle(Apple) as Apple).reset(152, 96);
					(mob.recycle(Apple) as Apple).reset(192, 112);
					(mob.recycle(Apple) as Apple).reset(208, 112);
					(mob.recycle(Apple) as Apple).reset(112, 160);
					(mob.recycle(Apple) as Apple).reset(144, 160);
					(mob.recycle(Apple) as Apple).reset(80, 184);
					(mob.recycle(Apple) as Apple).reset(168, 184);
					(mob.recycle(Apple) as Apple).reset(224, 184);
					(mob.recycle(Apple) as Apple).reset(24, 208);
					(mob.recycle(Apple) as Apple).reset(48, 208);
					(mob.recycle(Apple) as Apple).reset(224, 208);
					yummy.reset(40, 80);
					yummy.resize(1);
					return Stages.stage06();
				}break;
				case 6: {
					mob.add(new Apple(24 * 8, 6 * 8));
					mob.add(new Apple(13*8,8*8));
					mob.add(new Apple(6*8,14*8));
					mob.add(new Apple(19*8,16*8));
					mob.add(new Apple(23*8,21*8));
					mob.add(new Apple(20*8,22*8));
					mob.add(new Apple(12*8,24*8));
					mob.add(new Apple(8*8,25*8));
					yummy.reset(28 * 8, 4 * 8);
					yummy.resize(0.5);
					return Stages.stage07();
				}break;
				default: {
					FlxG.switchState(new MenuState());
					return "";
				}break;
			}
		}
	}
}