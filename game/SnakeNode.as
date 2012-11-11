package game {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import game.iDrawTo;
	final public class SnakeNode extends Sprite implements iDrawTo {
		private const DRAWWIDTH:int = 5;
		final public function SnakeNode(newPoint:Point):void {
			moveTo(newPoint);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		final private function init(event:Event):void {
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		final private function destroy(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		final public function drawTo(canvas:Sprite):void {
			canvas.graphics.beginFill(0x0);
			canvas.graphics.drawRect(x - DRAWWIDTH / 2, y - DRAWWIDTH / 2, DRAWWIDTH, DRAWWIDTH);
		}
		final public function moveTo(newPoint:Point):void {
			x = newPoint.x;
			y = newPoint.y;
		}
		final public function getPos():Point {
			return new Point(x, y);
		}
	}
}