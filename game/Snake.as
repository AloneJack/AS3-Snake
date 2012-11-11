package game {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import game.iTick;
	import game.iDrawTo;
	public class Snake extends MovieClip implements iTick, iDrawTo {
		private var myV:Number;
		private var myNodes:Array;
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
			
		}
		final public function drawTo(canvas:Sprite):void {
			for each(var myNode:iDrawTo in myNodes) myNode.drawTo(canvas);
		}
		final private function destroy(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
	}
}