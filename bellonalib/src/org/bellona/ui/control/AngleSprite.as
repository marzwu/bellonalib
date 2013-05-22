package org.bellona.ui.control
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	
	/**
	 * @author marzwu@gmail.com
	 * @date 2013-5-22
	 */
	public class AngleSprite extends Sprite
	{
		public function AngleSprite()
		{
			super();
			init();
		}
		
		private function init():void
		{
			var g:Graphics = this.graphics;
			g.beginFill(0x808080, .5);
			g.drawRect(0, 0, 256, 256);
			g.endFill();

			g.lineStyle(1, 0x00ffff, 1);
		}
		
		public function add(angle:Number, bRadian:Boolean = false):void
		{
			var radian:Number;
			if(bRadian){
				radian = angle;
			}else{
				radian = angle * Math.PI / 180.0;
			}
			
			var w_D_2:Number = width >> 1;
			var h_D_2:Number = height >> 1;
			var g:Graphics = graphics;
			g.moveTo(w_D_2, h_D_2);
			g.lineTo(w_D_2 * (1 + Math.cos(radian)), h_D_2 * (1 - Math.sin(radian)));
		}
		
		public function reset():void
		{
			graphics.clear();
			init();
		}
	}
}