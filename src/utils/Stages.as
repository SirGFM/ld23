package utils {
	/**
	 * ...
	 * @author GFM
	 */
	public class Stages {
		
		[Embed(source = "../../assets/stages/menu.txt", mimeType = "application/octet-stream")] static private var _menu:Class;
		[Embed(source = "../../assets/stages/stage01.txt", mimeType = "application/octet-stream")] static private var _stage01:Class;
		[Embed(source = "../../assets/stages/stage02.txt", mimeType = "application/octet-stream")] static private var _stage02:Class;
		[Embed(source = "../../assets/stages/stage03.txt", mimeType = "application/octet-stream")] static private var _stage03:Class;
		[Embed(source = "../../assets/stages/stage04.txt", mimeType = "application/octet-stream")] static private var _stage04:Class;
		[Embed(source = "../../assets/stages/stage05.txt", mimeType = "application/octet-stream")] static private var _stage05:Class;
		[Embed(source = "../../assets/stages/stage06.txt", mimeType = "application/octet-stream")] static private var _stage06:Class;
		[Embed(source = "../../assets/stages/stage07.txt", mimeType = "application/octet-stream")] static private var _stage07:Class;
		
		static public function menu():String {
			return new _menu;
		}
		
		static public function stage01():String {
			return new _stage01;
		}
		
		static public function stage02():String {
			return new _stage02;
		}
		
		static public function stage03():String {
			return new _stage03;
		}
		
		static public function stage04():String {
			return new _stage04;
		}
		
		static public function stage05():String {
			return new _stage05;
		}
		
		static public function stage06():String {
			return new _stage06;
		}
		static public function stage07():String {
			return new _stage07;
		}
	}
}