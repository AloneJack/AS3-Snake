package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.iTick;
	import game.Snake;
	final public class Main extends MovieClip implements iTick {
		private var mySnake:Snake;
		private var gameTimer:Timer = new Timer(100);
		private var gameField:Array;
		private const startingSnakeLen:int = 5;
		private const playingWidth:int = 20;
		private const playingHeight:int = playingWidth;
		public static const nodeWidth:int = 15;
		final public function Main(stage:Object):void {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		final private function init(event:Event):void {
			mySnake = new Snake(startingSnakeLen, new Point);
			gameField = [];
			for (var i:int = 0; i < playingWidth; i++) {
				gameField[i] = [];
				for (var q:int = 0; q < playingHeight; q++) {
					gameField[i][q] = 0;
				}
			}
			
			gameTimer.addEventListener(TimerEvent.TIMER, enterTick);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
			gameTimer.start();
		}
		final public function enterTick(event:TimerEvent):void {
			mySnake.enterTick(event);
			
			//graphics.clear();
			mySnake.drawTo(this);
		}
		final private function destroy(event:Event):void {
			gameTimer.removeEventListener(TimerEvent.TIMER, enterTick);
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			gameTimer.stop();
			gameTimer = null;
		}
	}
}