package game {
	import flash.events.TimerEvent;
	public interface iTick {
		function enterTick(event:TimerEvent):Void;
	}
}