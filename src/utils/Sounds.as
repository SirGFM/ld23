package utils {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Sounds {
		
		// sfx
		[Embed(source = "../../assets/sfx/apple.mp3")] static private var _collectMP3:Class;
		[Embed(source = "../../assets/sfx/jump.mp3")] static private var _jumpMP3:Class;
		// songs
		[Embed(source = "../../assets/sfx/ld23_song5.mp3")] static private var _mainSongMP3:Class;
		
		static private var _collect:FlxSound;
		static private var _jump:FlxSound;
		static private var _mainSong:FlxSound;
		static private var _playingSong:FlxSound;
		
		static public function init():void {
			/**/
			_collect = FlxG.loadSound(_collectMP3, 1.0, false, false, false);
			//_collect.stop();
			_jump = FlxG.loadSound(_jumpMP3, 1.0, false, false, false);
			//_jump.stop();
			_mainSong = FlxG.loadSound(_mainSongMP3, 1.0, true, false, false);
			//_mainSong.stop();
			/**/
			/*
			_collect = new FlxSound();
			_collect.loadEmbedded(_collectMP3);
			_jump = new FlxSound();
			_jump.loadEmbedded(_jumpMP3);
			_mainSong = new FlxSound();
			_mainSong.loadEmbedded(_mainSongMP3, true);
			_playingSong = null;
			/**/
		}
		
		static public function playCollect():void {
			//_collect.play();
			FlxG.play(_collectMP3);
		}
		
		static public function playJump():void {
			//_jump.play();
			FlxG.play(_jumpMP3);
		}
		
		static private function playSong(song:FlxSound):void {
			if (_playingSong == song) {
				return;
			}
			if (_playingSong != null) {
				_playingSong.stop();
			}
			_playingSong = song;
			song.play();
		}
		
		static public function playMainSong():void {
			//playSong(_mainSong);
			FlxG.play(_mainSongMP3, 1.0, true);
		}
		
		static public function resumeSong():void {
			_playingSong.play();
		}
		
		static public function pauseSong():void {
			_playingSong.pause();
		}
	}
}