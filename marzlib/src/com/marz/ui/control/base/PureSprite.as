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
		private var _autoDispose:Boolean; //是否自动销毁
		
		public function PureSprite() {
			list = new Array();
			autoDispose = true;
		}
		
		public function get autoDispose():Boolean {
			return _autoDispose;
		}
		
		public function set autoDispose(value:Boolean):void {
			_autoDispose = value;
			if (_autoDispose)
				addEventListener(Event.REMOVED, remove) //侦听删除事件 
			else
				removeEventListener(Event.REMOVED, remove) //侦听删除事件 
		}
		
		public function dispose():void {
			doRemove();
		}
		
		/**
		 * 重写addEventListener,在增加侦听的时候..把相应的事件保存到数组
		 * @param type
		 * @param listener
		 * @param useCapture
		 * @param priority
		 * @param useWeakReference
		 *
		 */
		override public function addEventListener(type:String, listener:Function,
												  useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			list.push([type, listener, useCapture])
			super.addEventListener(type, listener, useCapture, priority, useWeakReference)
		}
		
		private function remove(e:Event):void {
			if (e.currentTarget != e.target)
				return;
			doRemove();
		}
		
		/**
		 * "自我毁灭"的方法
		 * @param e
		 *
		 */
		private function doRemove():void {
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
