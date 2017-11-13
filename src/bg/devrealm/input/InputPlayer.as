package bg.devrealm.input
{
	import bg.devrealm.input.data.InputData;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	public class InputPlayer extends Object
	{
		public function InputPlayer(data:Array = null)
		{
			super();
			
			this.data = data;
			
			initialize();
		}
		public var data:Array = [];
		public var styles:InputCSSData = new InputCSSData();
		public var pointSize:uint = 7;
		public var display:* = new Shape();
		public var graphics:Graphics = display.graphics;
		
		public function start():void
		{
			var dataItem:InputData;
			
			for each(dataItem in data)
			{
				dataItem.id = setTimeout(handler, dataItem.time, dataItem);
			}
		}
		
		public function stop():void
		{
			var dataItem:InputData;
			
			for each(dataItem in data)
			{
				clearTimeout(dataItem.id);
				
				dataItem.id = -1;
			}
		}
		
		public function draw(data:InputData, graphics:Graphics = null, clear:Boolean = false):void
		{
			var event:* = data.event;
			
			if (!graphics)
				graphics = this.graphics;
			
			if (!graphics)
				return;
			
			if (clear)
				graphics.clear();
			
			graphics.beginFill(styles[event.type]);
			graphics.drawCircle(event.stageX, event.stageY, pointSize / 2);
		}
		
		protected function handler(data:InputData):void
		{
			draw(data, graphics);
		}
		
		protected function initialize():void
		{
			
		}
	}
}
