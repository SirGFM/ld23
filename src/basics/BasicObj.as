package basics {
	import components.Bar;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class BasicObj extends FlxSprite {
		
		public var size:Number;
		public var bad:Boolean;
		public var maxHealth:Number;
		private var autoCenter:Boolean;
		private var bar:Bar;
		
		public function BasicObj(X:Number = 0, Y:Number = 0, Size:Number = 0, SimpleGraphic:Class = null, MaxHealth:Number = 1, Gravity:Boolean = true, Bad:Boolean = false, AutoCenter:Boolean = false) {
			super(X, Y, SimpleGraphic);
			size = Size;
			bad = Bad;
			autoCenter = AutoCenter;
			if(Gravity){
				acceleration.y = 250;
			}
			maxHealth = health = MaxHealth;
			bar = new Bar(X - 2, Y - 2, 12, 1, 0xff007700, this, "health", "maxHealth");
			bar.kill();
		}
		
		override public function draw():void {
			super.draw();
			if (bar.alive) {
				bar.setPosition(x, y);
				bar.draw();
			}
		}
		
		override public function update():void {
			if (!onScreen()) {
				kill();
			}
			if (bar.alive) {
				bar.update();
			}
		}
		
		override public function kill():void {
			super.kill();
			bar.kill();
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			resize(1 - size);
			flicker(0);
			health = maxHealth;
			bar.setPosition(X, Y);
		}
		
		override public function hurt(Damage:Number):void {
			if(health != maxHealth){
				bar.revive();
			}
			super.hurt(Damage);
			resize( -Damage);
			if (health > maxHealth) {
				health = maxHealth;
			}
			if(Damage > 0){
				flicker(0.7);
			}
		}
		
		public function resize(incSize:Number = 1):void {
			var lastW:uint = width;
			var lastH:uint = height;
			size += incSize;
			scale.x += incSize;
			scale.y += incSize;
			width = frameWidth * scale.x;
			height = frameHeight * scale.y;
			centerOffsets(autoCenter);
		}
	}
}