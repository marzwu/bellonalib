package ui
{
	import flash.display.Sprite;
	
	import org.bellona.ui.control.AngleSprite;
	import org.bellona.utils.reversalVertical;
	
	
	/**
	 * @author marzwu@gmail.com
	 * @date 2013-5-22
	 */
	[SWF(width="1000", height="600")]
	public class AngleSpriteTester extends Sprite
	{
		public function AngleSpriteTester()
		{
			super();
			
			var angle:AngleSprite;
			
			angle = new AngleSprite;
			angle.x = 0;
			addChild(angle);
			
			angle.graphics.lineStyle(1, 0x00ffff);
			angle.add(reversalVertical(138));
			angle.add(reversalVertical(168));
			angle.add(reversalVertical(-173));
			
			angle.graphics.lineStyle(1, 0xff00ff);
			angle.add(reversalVertical(-135));
			angle.add(reversalVertical(-94));
			angle.add(reversalVertical(-55));
			
			angle.graphics.lineStyle(1, 0xffff00);
			angle.add(reversalVertical(-3));
			angle.add(reversalVertical(27));
			angle.add(reversalVertical(74));

			angle = new AngleSprite;
			angle.x = 256;
			addChild(angle);
			
			angle.graphics.lineStyle(1, 0x00ffff);
			angle.add(reversalVertical(2.42), true);
			angle.add(reversalVertical(2.94), true);
			angle.add(reversalVertical(-3.02), true);
			
			angle.graphics.lineStyle(1, 0xff00ff);
			angle.add(reversalVertical(-2.36), true);
			angle.add(reversalVertical(-1.64), true);
			angle.add(reversalVertical(-0.95), true);
			
			angle.graphics.lineStyle(1, 0xffff00);
			angle.add(reversalVertical(-0.05), true);
			angle.add(reversalVertical(0.46), true);
			angle.add(reversalVertical(1.29), true);
			
		}
	}
}