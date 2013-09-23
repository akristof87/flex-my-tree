package tree
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	public class MyNode extends UIComponent
	{
		private var circle:Sprite;
		private var selectedCircle:Sprite; 
		
		private var _selected:Boolean;
		private var selected_propertyChanged:Boolean;
		
		private var _watched:Boolean;
		private var watched_propertyChanged:Boolean;
		
		public function MyNode()
		{
			super();
			_selected = false;
			_watched = false;
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.RIGHT_CLICK, onRightClick);
		}
		
		protected function onRightClick(event:MouseEvent):void
		{
			trace ("on right click");
			watched = !watched;
		}
		
		protected function onClick(event:MouseEvent):void
		{
			trace("on click"); 	
			selected = !selected;
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
				circle.width = unscaledWidth * 0.75;
				circle.height = unscaledHeight * 0.75;
			}
			if(selectedCircle){
				selectedCircle.width = unscaledWidth;
				selectedCircle.height = unscaledHeight;
			}
		}

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected = value;
			selected_propertyChanged = true;
			invalidateProperties();
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if(selected) {
				if(!selectedCircle) {
					selectedCircle = new Sprite();
					selectedCircle.graphics.lineStyle(1, 0x0000aa);
					selectedCircle.graphics.drawCircle(0, 0, 10);
					addChild(selectedCircle);
				}
				else {
					//already exists
				}
			}
			else {
				if(selectedCircle) {
					removeChild(selectedCircle);
					selectedCircle = null;
				}
				else {
					//already not drawed
				}
			}
			selected_propertyChanged = false;
			
			removeChild(circle);
			circle = new Sprite();
			circle.graphics.lineStyle(1);
			if(watched) {
				circle.graphics.beginFill(0x0000ff);
			}
			else {
				circle.graphics.beginFill(0xff0000);
			}
			circle.graphics.drawCircle(0, 0, 10);
			circle.graphics.endFill();
			addChild(circle);
			watched_propertyChanged = false;
			invalidateDisplayList();
		}

		public function get watched():Boolean
		{
			return _watched;
		}

		public function set watched(value:Boolean):void
		{
			_watched = value;
			watched_propertyChanged = true;
			invalidateProperties();
			invalidateDisplayList();
		}


	}
}