package tree
{
	
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.graphics.SolidColor;
	
	import spark.components.Group;
	import spark.primitives.Ellipse;
	import spark.primitives.Graphic;
	import spark.primitives.Rect;

	public class MyTree extends UIComponent
	{
		private const diameter:Number = 10;
		private var group:Group;
		private var bg:Rect;
		
		private var rootNode:MyNode;
		private var INode:MyNode;
		private var IINode:MyNode;
		
		private var lineR_I:MyLine;
		private var lineR_II:MyLine;
		
		public function MyTree()
		{
			super();
		}
		
		override protected function createChildren():void {
			super.createChildren();
			if(!group) {
				var group:Group = new Group();
				addChild(group);
			}
			if(!bg) {
				bg = new Rect();
				bg.x = 0;
				bg.y = 0;
				bg.width = width;
				bg.height = height;
				bg.fill = new SolidColor(0xf2d962);
				group.addElement(bg);
			}
			if(!lineR_I) {
				lineR_I = new MyLine();
				group.addElement(lineR_I);
			}
			if(!lineR_II) {
				lineR_II = new MyLine();
				group.addElement(lineR_II);
			}
			if(!rootNode)
			{
				rootNode = new MyNode();
				rootNode.selected = true;
				group.addElement(rootNode);
			}
			if(!INode)
			{
				INode = new MyNode();
				group.addElement(INode);
			}
			if(!IINode)
			{
				IINode = new MyNode();
				group.addElement(IINode);
			}
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			if(bg) {
				bg.width = unscaledWidth;
				bg.height = unscaledHeight;
			}
			
			if(rootNode) {
				rootNode.width = unscaledWidth / diameter;
				rootNode.height = unscaledWidth / diameter;
				rootNode.x = width/2;
				rootNode.y = rootNode.height / 2; 
			}
			if(INode) {
				INode..width = unscaledWidth / diameter;
				INode.height = unscaledWidth / diameter;
				INode.x = width/3;
				INode.y = INode.height / 2 * 3;
			}
			if(IINode) {
				IINode.width = unscaledWidth / diameter;
				IINode.height = unscaledWidth / diameter;
				IINode.x = width/3 * 2;
				IINode.y = IINode.height / 2 * 3;
			}
			
			if(lineR_I) {
				lineR_I.toLeft = true;
				lineR_I.x = rootNode.x;
				lineR_I.y = rootNode.y;
				lineR_I.width = Math.abs(rootNode.x - INode.x);
				lineR_I.height = Math.abs(rootNode.y - INode.y);
				lineR_I.invalidateDisplayList();
			}
			
			if(lineR_II) {
				lineR_II.toLeft = false;
				lineR_II.x = rootNode.x;
				lineR_II.y = rootNode.y;
				lineR_II.width = Math.abs(rootNode.x - IINode.x);
				lineR_II.height = Math.abs(rootNode.y - IINode.y);
				lineR_II.invalidateDisplayList();
			}
		}
		
		private function createNode():Ellipse
		{
			var result:Ellipse = new Ellipse();
			result.width = diameter;
			result.height = diameter;
			result.fill = new SolidColor();
			
			return result;
		}

		//----------- logic ----------------
		
		public function onLeft():void {
			if(rootNode.selected) {
				rootNode.watched = true;
				rootNode.selected = false;
				INode.selected = true;
			}
		}
		
		public function onRight():void {
			if(rootNode.selected) {
				rootNode.watched = true;
				rootNode.selected = false;
				IINode.selected = true;
			}
		}
		
		public function onBack():void {
			if(INode.selected) {
				INode.watched = true;
				INode.selected = false;
				rootNode.selected = true;
			}
			if(IINode.selected) {
				IINode.watched = true;
				IINode.selected = false;
				rootNode.selected = true;
			}
		}
	}
}