package bg.devrealm
{
	import bg.devrealm.input.InputLogger;
	import bg.devrealm.input.InputPlayer;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	public class InputLoggerTest extends Sprite
	{
		public static function createTextField(text:String = '', container:DisplayObjectContainer = null, tf:TextField = null):TextField
		{
			if (!tf)
				tf = new TextField();
			
			tf.text = text;
			
			if (container)
				container.addChild(tf);
			
			return tf;
		}
		
		public function InputLoggerTest()
		{
			super();
			
			initialize();
		}
		
		protected function initialize():void
		{
			createTextField('TEST', this);
			
			startTest();
		}
		
		private function startTest():void
		{
			InputLogger.initialize(stage);
			
			setTimeout(stopLogger, 3000);
			
			setInterval(stopLogger, 4000);
		}
		
		private function stopLogger():void
		{
			var logger:InputLogger = InputLogger.instance;
			var data:Array = logger.data;
			
			logger.stage = stage;
			logger.dispose();
			
			this.graphics.clear();
			
			var player:InputPlayer = new InputPlayer(data);
			player.graphics = this.graphics;
			player.start();
		}
	}
}