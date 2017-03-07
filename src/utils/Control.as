package utils {
	
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Control {
		
		private var UP:String = "W";
		private var DOWN:String = "S";
		private var LEFT:String = "A";
		private var RIGHT:String = "D";
		private var ACTION:String = "SPACE";
		
		public function Control() {
			// TODO allow other settings
		}
		
		public function get up():Boolean {
			return FlxG.keys.pressed(UP);
		}
		
		public function get j_up():Boolean {
			return FlxG.keys.justPressed(UP);
		}
		
		public function get down():Boolean {
			return FlxG.keys.pressed(DOWN);
		}
		
		public function get j_down():Boolean {
			return FlxG.keys.justPressed(DOWN);
		}
		
		public function get left():Boolean {
			return FlxG.keys.pressed(LEFT);
		}
		
		public function get j_left():Boolean {
			return FlxG.keys.justPressed(LEFT);
		}
		
		public function get right():Boolean {
			return FlxG.keys.pressed(RIGHT);
		}
		
		public function get j_right():Boolean {
			return FlxG.keys.justPressed(RIGHT);
		}
		
		public function get action():Boolean {
			return FlxG.keys.pressed(ACTION);
		}
		
		public function get j_action():Boolean {
			return FlxG.keys.justPressed(ACTION);
		}
	}
}