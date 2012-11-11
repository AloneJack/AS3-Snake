package game {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import game.iTick;
	public class Snake extends MovieClip implements iTick; {
		final public function Snake():void {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		final private function init(event:Event):void {
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		final public function enterTick(event:TimerEvent):void {
			
		}
		final private function destroy(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
	}
}