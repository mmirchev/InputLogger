package bg.devrealm.input
{
	import bg.devrealm.input.data.InputData;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	public class InputPlayer extends Object
	{
        public var data:Array = [];
        public var styles:InputCSSData = new InputCSSData();
        public var pointSize:uint = 7;
        public var display:* = new Shape();
        public var graphics:Graphics = display.graphics;

		public function InputPlayer(data:Array = null)
		{
			super();
			
			this.data = data;
			
			initialize();
		}

		public function start():void
		{
			var dataItem:Object;
			
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
		
		public function draw(data:Object, graphics:Graphics = null, clear:Boolean = false):void
		{
			if (!graphics)
				graphics = this.graphics;
			
			if (!graphics)
				return;
			
			if (clear)
				graphics.clear();
			
			graphics.beginFill(styles[data.event]);
			graphics.drawCircle(data.x, data.y, pointSize / 2);
		}
		
		protected function handler(data:Object):void
		{
			draw(data, graphics);
		}
		
		protected function initialize():void
		{
			
		}
	}
}
