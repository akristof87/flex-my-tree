package tree
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	public class MyNode extends UIComponent
	{
		private var circle:Sprite;
		
		public function MyNode()
		{
			super();
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			trace("on click"); 			
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if(!circle) {
				circle = new Sprite();
				circle.graphics.lineStyle(1);
				circle.graphics.beginFill(0x0000ff);
				circle.graphics.drawCircle(0, 0, 10);
				circle.graphics.endFill();
				addChild(circle);
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			if(circle){
				circle.width = unscaledWidth;
				circle.height = unscaledHeight;
			}
		}
	}
}