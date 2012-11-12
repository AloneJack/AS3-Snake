package toolkit{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent
	import flash.ui.Keyboard;
	final public class Keylogger{
		private static var allKeys:Array = new Array(250);
		private static var newKeys:Array = new Array(250);
		final public function Keylogger(myStage:Object):void{
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, newDown);
			myStage.addEventListener(KeyboardEvent.KEY_UP, newUp);
			myStage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown)
			myStage.addEventListener(MouseEvent.MOUSE_UP, mouseUp)
		}
		final public function wipeNewKeys():void {
			 newKeys = new Array(250);
		}
		final private function newDown(event:KeyboardEvent):void {
			newKeys[event.keyCode] = !allKeys[event.keyCode];
			allKeys[event.keyCode] = true;
		}
		final private function newUp(event:KeyboardEvent):void{
			newKeys[event.keyCode] = allKeys[event.keyCode] = false;
		}
		final private function mouseDown(event:MouseEvent):void {
			newKeys[1] = !allKeys[1];
			allKeys[1] = true;
		}
		final private function mouseUp(event:MouseEvent):void{
			newKeys[1] = allKeys[1] = false;
		}
		public static function isDown(...keys:Array):Boolean{ return testElements(keys, allKeys); }
		public static function isNewDown(...keys:Array):Boolean { return testElements(keys, newKeys); }
		public static function killNewKey(aKey:int):void{ newKeys[aKey] = false}
		private static function testElements(intersects:Array, base:Array):Boolean{
			var i:int;
			var allPressed:Boolean = true;
			for(i=0;i<intersects.length;i++) if(!Boolean(base[intersects[i]])) {
				allPressed = false;
				break;
			}
			return allPressed;
		}
	}
}