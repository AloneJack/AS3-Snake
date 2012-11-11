package toolkit {
	import flash.events.Event;
	import flash.utils.getTimer;
	import flash.text.TextField;
	import flash.text.TextFormat;
	final public class FPSmonitor extends TextField {
		private var pasTimes:Array = [];
		private var lastDelay:int;
		final public function FPSmonitor():void {
			defaultTextFormat = new TextFormat("Tahoma", 9, 0x000000)
			addEventListener(Event.ENTER_FRAME, enterFrame);
			addEventListener(Event.REMOVED_FROM_STAGE, killObj);
		}
		final private function enterFrame(event:Event):void {
			if (!lastDelay) {
				lastDelay = getTimer()
				return;
			}
			if (pasTimes.length >= 10) pasTimes.shift();
			pasTimes.push((getTimer() - lastDelay));
			lastDelay = getTimer();
			var aggregateTime:int = 0;
			for each(var aTime:int in pasTimes) aggregateTime += aTime
			text = String(Math.floor(pasTimes.length/aggregateTime*10000)/10)
		}
		final private function killObj(event:Event):void {
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			removeEventListener(Event.REMOVED_FROM_STAGE, killObj);
		}
	}
}