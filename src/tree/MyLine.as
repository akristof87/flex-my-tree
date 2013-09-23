package tree
{
	import flash.display.Sprite;
	
	import mx.core.UIComponent;

	public class MyLine extends UIComponent
	{
		private var _toLeft:Boolean;
		private var lineChanged:Boolean;
		
		private var line:Sprite;
		
		public function MyLine()
		{
			super();
		}
		
		override protected function createChildren():void {
			super.createChildren();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			if(line) {
				removeChild(line);
			}
			line = new Sprite();
			line.graphics.lineStyle(1);
			line.graphics.moveTo(0, 0);
			line.graphics.lineTo((toLeft?width:-width), height);
			line.width = unscaledWidth;
			line.height = unscaledHeight;
			this.addChild(line);
		}


		public function get toLeft():Boolean
		{
			return _toLeft;
		}

		public function set toLeft(value:Boolean):void
		{
			_toLeft = value;
			lineChanged = true;
			invalidateDisplayList();
		}


	}
}