package game {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import game.iDrawTo;
	public class FoodItem extends MovieClip implements iDrawTo {
		private var myPos:Point;
		public function FoodItem(newPos:Point):void {
			setPos(newPos);
		}
		public function drawTo(canvas:Sprite):void {
			canvas.graphics.beginFill(0x00AA00);
			canvas.graphics.drawRect(myPos.x * Main.nodeWidth, myPos.y * Main.nodeWidth, Main.nodeWidth, Main.nodeWidth);
		}
		public function getPos():Point {
			return myPos.clone();
		}
		public function get myX():int {
			return myPos.x;
		}
		public function get myY():int {
			return myPos.y;
		}
		public function setPos(newPos:Point):void {
			myPos = newPos;
		}
	}
}