package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.FoodItem;
	import game.iDrawTo;
	import game.iTick;
	import game.Snake;
	import game.KeyManager;
	import toolkit.Keylogger;
	final public class Main extends MovieClip implements iTick {
		private var mySnake:Snake;
		private var gameTimer:Timer = new Timer(30);
		private var gameField:Array;
		private var myKeylogger:Keylogger;
		private var myFood:Array;
		private const startingSnakeLen:int = 5;
		private const playingWidth:int = 20;
		private const playingHeight:int = playingWidth;
		public static const nodeWidth:int = 15;
		final public function Main(stage:Object):void {
			myKeylogger = new Keylogger(stage);
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
			myFood = [new FoodItem(randomAvailableGamePoint())];
			gameTimer.addEventListener(TimerEvent.TIMER, enterTick);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
			gameTimer.start();
		}
		final public function enterTick(event:TimerEvent):void {
			mySnake.changeDirection(KeyManager.getDirection());
			mySnake.enterTick(event);
			mySnake.wrap(playingWidth, playingHeight);
			testEat();
			testGameOver();
			graphics.clear();
			mySnake.drawTo(this);
			for each(var foodNode:iDrawTo in myFood) foodNode.drawTo(this);
		}
		final private function testEat():void {
			var snakePos:Point = mySnake.getHeadPos();
			var targetPoint:Point;
			for (var i:int = 0; i < myFood.length; i++) {
				targetPoint = FoodItem(myFood[i]).getPos();
				if (snakePos.equals(targetPoint)) {
					mySnake.grow(1);
					if (myFood.length == 1) {
						FoodItem(myFood[i]).setPos(randomAvailableGamePoint());
					}else  myFood.splice(i, 1);
					return;
				}
			}
		}
		final private function testGameOver():void {
			
		}
		final private function randomAvailableGamePoint():Point {
			if (gameField.length == 0) throw new Error("gameField array length zero");
			var myPoint:Point;
			do {
				myPoint = new Point(Math.floor(Math.random() * gameField.length), Math.floor(Math.random() * gameField[0].length));
			}while (gameField[myPoint.x][myPoint.y] != 0)
			return myPoint;
		}
		final private function destroy(event:Event):void {
			gameTimer.removeEventListener(TimerEvent.TIMER, enterTick);
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			gameTimer.stop();
			gameTimer = null;
		}
	}
}