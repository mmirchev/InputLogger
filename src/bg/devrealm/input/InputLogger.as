package bg.devrealm.input
{
	import bg.devrealm.input.data.InputData;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class InputLogger extends Object
	{
		public static const MOUSE_EVENTS:Array =
				[
					MouseEvent.CLICK,
					
					MouseEvent.DOUBLE_CLICK,
					
					MouseEvent.MIDDLE_CLICK,
					MouseEvent.MIDDLE_MOUSE_DOWN,
					MouseEvent.MIDDLE_MOUSE_UP,
					
					MouseEvent.MOUSE_DOWN,
					MouseEvent.MOUSE_MOVE,
					MouseEvent.MOUSE_OUT,
					MouseEvent.MOUSE_OVER,
					MouseEvent.MOUSE_UP,
					
					MouseEvent.RELEASE_OUTSIDE,
					
					MouseEvent.RIGHT_CLICK,
					MouseEvent.RIGHT_MOUSE_UP,
					MouseEvent.ROLL_OUT,
					MouseEvent.ROLL_OVER
				];
		
		public static const KEYBOARD_EVENTS:Array =
				[
					KeyboardEvent.KEY_UP,
					KeyboardEvent.KEY_DOWN
				];
		
		public static const EVENT_TYPES:Array = [].concat(MOUSE_EVENTS).concat(KEYBOARD_EVENTS);
		
		public static var stage:Stage;
		public static var instance:InputLogger;
		
		public static function initialize(stage:Stage = null):void
		{
			InputLogger.stage = stage;
			
			InputLogger.instance = new InputLogger(stage);
		}
		
		//
		
		public function InputLogger(stage:Stage = null)
		{
			super();
			
			initialize(stage);
		}
		public var stage:Stage;
		public var data:Array;
		
		public function initialize(stage:Stage = null):void
		{
			this.stage = stage;
			
			this.data = [];
			
			addListeners();
		}
		
		public function dispose():void
		{
			removeListeners();
			
			this.stage = null;
		}
		
		private function addListeners():void
		{
			var type:String;
			
			for each(type in EVENT_TYPES)
			{
				this.stage.addEventListener(type, handler, true);
			}
		}
		
		private function removeListeners():void
		{
			var type:String;
			
			for each(type in EVENT_TYPES)
			{
				this.stage.removeEventListener(type, handler, true);
			}
		}
		
		protected function handler(event:Event):void
		{
			var item:InputData = new InputData(event)
			
			this.data.push(item);
		}
	}
}
