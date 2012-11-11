package game {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import game.iTick;
	import game.iDrawTo;
	public class Snake extends MovieClip implements iTick, iDrawTo {
		private var myVel:Number;
		private var myNodes:Array;
		private var vx:Number;
		private var vy:Number;
		final public function Snake(nodeCount:int, beginPoint:Point):void {
			myNodes = [];
			for (var i:int = 0; i < nodeCount; i++) myNodes.push(new SnakeNode(beginPoint));
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		final private function init(event:Event):void {
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		final public function enterTick(event:TimerEvent):void {
			if (myNodes.length <= 0) return;
			var prevPos:Point = SnakeNode(myNodes[0]).getPos();
			var myNode:SnakeNode;
			for (var i:int = 1; i < myNodes.length;i++) {
				myNode.moveTo(prevPos);
				prevPos = SnakeNode(myNodes[i]).getPos();
			}
			SnakeNode(myNodes[0]).moveTo(SnakeNode(myNodes[0]).getPos().add(new Point(vx, vy)));
		}
		final public function drawTo(canvas:Sprite):void {
			for each(var myNode:iDrawTo in myNodes) myNode.drawTo(canvas);
		}
		final private function destroy(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
	}
}