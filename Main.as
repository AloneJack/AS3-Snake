package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.iTick;
	final public class Main extends MovieClip implements iTick {
		private var mySnake = new Snake;
		private var gameTimer:Timer = new Timer(100);
		private const playingWidth:int = 20;
		public static const nodeWidth:int = 15;
		final public function Main(stage:Object):void {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		final private function init(event:Event):void {
			gameTimer.addEventListener(TimerEvent.TIMER, enterTick);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		final private function enterTick(event:TimerEvent):void {
			
			
		}
		final private function destroy(event:Event):void {
			gameTimer.removeEventListener(TimerEvent.TIMER, enterTick);
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			gameTimer.stop();
			gameTimer = null;
		}
	}
}