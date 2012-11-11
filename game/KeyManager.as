package game {
	import flash.events.Event;
	import flash.ui.Keyboard;
	import toolkit.Keylogger;
	import game.directions;
	final public class KeyManager extends Object {
		final public function KeyManager():void {
			throw new Error("Abstract class KeyManager initialized");
		}
		public static function getDirection():int {
			if (Keylogger.isNewDown(Keyboard.LEFT)) return 0;
			else if (Keylogger.isNewDown(Keyboard.UP)) return 1;
			else if (Keylogger.isNewDown(Keyboard.RIGHT)) return 2;
			else if (Keylogger.isNewDown(Keyboard.DOWN)) return 3;
			return -1;
		}
	}
}