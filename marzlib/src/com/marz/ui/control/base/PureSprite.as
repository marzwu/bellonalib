package com.marz.ui.control.base {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 *
	 * @author marz
	 */
	public class PureSprite extends Sprite {
		private var list:Array; //定义一数组保存侦听 

		public function PureSprite() {
			list = new Array()
			addEventListener(Event.REMOVED, remove) //侦听删除事件 
		}

		//重写addEventListener,在增加侦听的时候..把相应的事件保存到数组 
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			list.push([type, listener, useCapture])
			super.addEventListener(type, listener, useCapture, priority, useWeakReference)
		}

		//"自我毁灭"的方法 
		private function remove(e:Event):void {
			if (e.currentTarget != e.target)
				return;
			//删除子对象 
			trace("删除前有子对象", numChildren)
			while (numChildren > 0) {
				removeChildAt(0)
			}
			trace("删除后有子对象", numChildren)

			//删除动态属性 
			for (var k:String in this) {
				trace("删除属性", k)
				delete this[k]
			}

			//删除侦听 
			for (var i:uint = 0; i < list.length; i++) {
				trace("删除Listener", list[i][0])
				removeEventListener(list[i][0], list[i][1], list[i][2])
			}
			list = null
		}
	}
}
