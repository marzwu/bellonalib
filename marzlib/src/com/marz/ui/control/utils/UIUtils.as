package com.marz.ui.control.utils {
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	/**
	 *
	 * @author marz
	 */
	public class UIUtils {
		public static function centerToParent(src:DisplayObject, parent:DisplayObject):void {
			src.x = (parent.width - src.width) / 2;
			src.y = (parent.height - src.height) / 2;
		}

		public static function centerToRect(src:DisplayObject, rect:Rectangle):void {
			src.x = rect.x + (rect.width - src.width) / 2;
			src.y = rect.y + (rect.height - src.height) / 2;
		}
	}
}
