package game {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import game.iTick;
	import game.iDrawTo;
	public class Snake extends MovieClip implements iTick, iDrawTo {
		private var SPEED:Number = 1;
		private var myNodes:Array;
		private var vx:Number;
		private var vy:Number;
		final public function Snake(nodeCount:int, beginPoint:Point):void {
			myNodes = [];
			vx = SPEED;
			vy = 0;
			for (var i:int = 0; i < nodeCount; i++) myNodes.push(new SnakeNode(beginPoint));
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		final private function init(event:Event):void {
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		final public function enterTick(event:TimerEvent):void {
			if (!myNodes || myNodes.length <= 0) return;
			var myNode:SnakeNode;
			for (var i:int = myNodes.length-1; i > 0; i--) {
				myNode = myNodes[i];
				myNode.moveTo(myNodes[i-1].getPos());
			}
			SnakeNode(myNodes[0]).moveTo(SnakeNode(myNodes[0]).getPos().add(new Point(vx, vy)));
		}
		final public function changeDirection(newDirection:int):void {
			if (newDirection < 0 || getDirection() == newDirection || (getDirection() + newDirection) % 2 == 0) return;
			switch(newDirection) {
				case 0: vx = -SPEED;
					vy = 0;
					break;
				case 1: vx = 0;
					vy = -SPEED;
					break;
				case 2: vx = SPEED;
					vy = 0;
					break;
				case 3: vx = 0;
					vy = SPEED;
					break;
				default:
					break;
			}
		}
		final public function getDirection():int {
			if (vx > 0) return 2;
			else if (vx < 0) return 0;
			else if (vy < 0) return 1;
			else if (vy > 0) return 3;
			throw new Error("Velocity variables unyeilding");
			return -1;
		}
		final public function wrap(w:int, h:int):void {
			for each(var myNode:SnakeNode in myNodes) myNode.wrap(w, h);
		}
		final public function drawTo(canvas:Sprite):void {
			for each(var myNode:iDrawTo in myNodes) myNode.drawTo(canvas);
		}
		final public function getHeadPos():Point {
			if (myNodes.length < 0) throw new Error("Snake body non existant");
			return SnakeNode(myNodes[0]).getPos();
		}
		final public function grow(nodes:int):void {
			for (var i:int = 0; i < nodes;i++) myNodes.push(new SnakeNode(getHeadPos()));
		}
		final public function hittingSelf():Boolean {
			var headPoint:Point = getHeadPos();
			for (var i:int = 1; i < myNodes.length; i++) if (headPoint.equals(SnakeNode(myNodes[i]).getPos())){
				for (var q:int = 0; q < myNodes.length; q++) SnakeNode(myNodes[q]).setColour(0xFF0000);
				return true;
			}
			return false;
		}
		final private function destroy(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
	}
}