package bg.devrealm.input.data
{
	import flash.events.Event;
	import flash.utils.getTimer;
	
	public class InputData extends Object
	{
		public function InputData(event:Event = null, time:int = -1)
		{
			super();
			
			if (time < 0)
				time = getTimer();
			
			this.event = event;
			
			this.time = time;
		}
		public var time:int;
		public var event:Event;
		public var id:int;
		
		public function toString():String
		{
			return "[InputData(event=" + this.event + ")]";
		}

		public function export():Object
		{
			var result =
			{
				event: event.type,

				x: ( ('stageX' in event) ? event['stageX'] : -1 ),
				y: ( ('stageY' in event) ? event['stageY'] : -1 ),

				time : time
			};

			return result;
		}
	}
}
