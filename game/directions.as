package game {
	final public class directions {
		public static const LEFT:int = 0;
		public static const UP:int = 1;
		public static const RIGHT:int = 2;
		public static const DOWN:int = 3;
		final public function directions():void {
			throw new Error("Abstract class directions initialized!");
		}
	}
}