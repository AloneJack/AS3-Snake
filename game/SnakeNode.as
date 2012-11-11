package game {
	import flash.display.Sprite;
	import flash.events.Event;
	final public class SnakeNode extends Sprite {
		private const DRAWWIDTH:int = 5;
		final public function SnakeNode():void {
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
		final public function moveTo(newX:Number, newY:Number):void {
			x = newX;
			y = newY;
		}
	}
}