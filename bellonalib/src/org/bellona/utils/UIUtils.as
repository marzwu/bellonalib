package org.bellona.utils {
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * UI的一些方便的方法
	 * @author marz
	 */
	public class UIUtils {
		public static const RIGHT:String = 'right';
		public static const TOP:String = 'top';
		public static const LEFT:String = 'left';
		public static const BOTTOM:String = 'bottom';
		/**
		 * 定位到父容器的中间
		 * @param src
		 * @param des 父容器
		 *
		 */
		public static function centerToParent(self:DisplayObject):void {
			self.x = (self.parent.width - self.width) >> 1;
			self.y = (self.parent.height - self.height) >> 1;
		}
		
		/**
		 * 定位到坐标系内的某矩形的中间
		 * @param src
		 * @param rect 与src坐标系相同
		 *
		 */
		public static function centerToRect(self:DisplayObject, rect:Rectangle):void {
			self.x = rect.x + ((rect.width - self.width) >> 1);
			self.y = rect.y + ((rect.height - self.height) >> 1);
		}
		
		public static function centerToStage(self:DisplayObject, stage:Stage):void {
			self.x = 0 + ((stage.stageWidth - self.width) >> 1);
			self.y = 0 + ((stage.stageHeight - self.height) >> 1);
		}
		
		public static function getStagePos(dis:DisplayObject, offset:Point):Point
		{
			var global:Point = dis.localToGlobal(offset);
			return global;
		}
		
		public static function setToStagePos(dis:DisplayObject, des:Point):void
		{
			var pos:Point = dis.parent.globalToLocal(des);
			dis.x = pos.x;
			dis.y = pos.y;
		}
		
		
		/**
		 * 定位到des的右侧
		 * @param src
		 * @param des 与src坐标系相同
		 *
		 */
		public static function rightTo(self:DisplayObject, des:DisplayObject, gap:int = 8):void {
			self.x = des.x + des.width + gap;
		}
		
		/**
		 * 定位到des的下面
		 * @param src
		 * @param des 与src坐标系相同
		 *
		 */
		public static function bottomTo(self:DisplayObject, des:DisplayObject, gap:int = 8):void {
			self.y = des.y + des.height + gap;
		}
		
		/**
		 * 与des纵向居中对齐
		 * @param src
		 * @param des 与src坐标系相同
		 *
		 */
		public static function verticalMiddleTo(self:DisplayObject, des:DisplayObject):void {
			self.y = des.y + ((des.height - self.height) >> 1);
		}
		
		public static function horizontalCenterTo(self:DisplayObject, des:DisplayObject):void {
			if(des is Stage){
				self.x = ((des as Stage).stageWidth - self.width) >> 1;
			}else{
				self.x = des.x + ((des.width - self.width) >> 1);
			}
		}
		
		public static function verticalMiddleToParent(self:DisplayObject):void {
			self.y = ((self.parent.height - self.height) >> 1);
		}
		
		public static function horizontalCenterToParent(self:DisplayObject):void {
			self.x = ((self.parent.width - self.width) >> 1);
		}
		
		public static function removeFromParent(self:DisplayObject):void {
			if (self && self.parent) {
				self.parent.removeChild(self);
			}
		}
		
		public static function setPivotX(self:DisplayObject, pivotX:int):void {
			self.x = -pivotX;
		}
		
		public static function setPivotY(self:DisplayObject, pivotY:int):void {
			self.y = -pivotY;
		}
		
		public static function setPivot(self:DisplayObject, pivotX:int, pivotY:int):void {
			setPivotX(self, pivotX);
			setPivotY(self, pivotY);
		}
		
		public static function setPivotDefault(self:DisplayObject):void {
			setPivotX(self, self.width >> 1);
			setPivotY(self, self.height >> 1);
		}
		
		public static function swapPos(dis1:DisplayObject, dis2:DisplayObject):void
		{
			var x:Number = dis1.x;
			var y:Number = dis1.y;
			dis1.x = dis2.x;
			dis1.y = dis2.y;
			dis2.x = x;
			dis2.y = y;
		}
		
		public static function align(src:DisplayObject, refer:DisplayObject, pos:String):void
		{
			switch(pos)
			{
				case LEFT:
					src.x = refer.x;
					break;
				case TOP:
					src.y = refer.y;
					break;
				case RIGHT:
					src.x = refer.x + refer.width - src.width;
					break;
				case BOTTOM:
					src.y = refer.y + refer.height - src.height;
					break;
				default:
					break;
			}
		}

		/**判断是否是显示对象，或者父对象是比较的显示对象*/
		public static function isOrParentIs(dis:DisplayObject, target:DisplayObject):void{
			if(dis == null){
				return false;
			}

			while(true){
				if(dis == target){
					return true;
				}
				dis = dis.parent;
			}

			return false;
		}

	}
}
