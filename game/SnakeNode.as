package game {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import game.iDrawTo;
	final public class SnakeNode extends Sprite implements iDrawTo {
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
			var x:Number = this.x * Main.nodeWidth;
			var y:Number = this.y * Main.nodeWidth;
			canvas.graphics.drawRect(x, y, Main.nodeWidth , Main.nodeWidth);
		}
		final public function moveTo(newPoint:Point):void {
			x = newPoint.x;
			y = newPoint.y;
		}
		final public function wrap(width:int, height:int):void {
			x %= width;
			y %= height;
		}
		final public function getPos():Point {
			return new Point(x, y);
		}
	}
}