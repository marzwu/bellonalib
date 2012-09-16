package com.marz.control
{
	import com.marz.string.StringUtil;
	
	import flash.display.DisplayObject;
	import flash.text.StyleSheet;
	import flash.text.TextFieldAutoSize;


	public class SealedTextFieldRich extends SealedTextField
	{
		public static const MARGIN:int = 4;


		protected var _styleSheet:StyleSheet;

		protected var _bold:Boolean;
		protected var _fontSize:int;
		protected var _color:uint;

		public function SealedTextFieldRich(
			text:String = '', color:uint = 0xffffff,
			bold:Boolean = false, fontSize:int = 12,
			bMultiline:Boolean = false,
			autoSize:String = TextFieldAutoSize.LEFT)
		{
			super(bMultiline);

			this.autoSize = autoSize;

			_color = color;
			_bold = bold;
			_fontSize = fontSize;
			_textAlign = autoSize;

			_styleSheet = new StyleSheet;
			attachStyleSheet();

			htmlText = text;
		}

		override public function set htmlText(value:String):void
		{
			super.htmlText = StringUtil.substitute('<p>{0}</p>', value);

			if (_widthSpecific >= 0 || _heightSpecific >= 0)
			{
				autoSize = TextFieldAutoSize.NONE;
				wordWrap = true;

				if (_widthSpecific >= 0)
					width = _widthSpecific
				else
					width = textWidth + 4 + 4

				if (_heightSpecific >= 0)
					height = _heightSpecific
				else
					height = textHeight + 4 + 4
			}
		}

		override public function get htmlText():String
		{
			var rslt:String = super.htmlText;
			if (rslt.indexOf('<p>') >= 0)
				rslt = rslt.slice(3, rslt.length - 4);
			return rslt;
		}

		public function set bold(value:Boolean):void
		{
			if (_bold != value)
			{
				_bold = value;
				attachStyleSheet();
			}
		}

		public function set fontSize(value:int):void
		{
			if (_fontSize != value)
			{
				_fontSize = value;
				attachStyleSheet();
			}
		}

		protected function formStyleStr():String
		{
			return StringUtil.substitute(
				'p{' +
				'color:#{0};' +
				'font-weight:{1};' +
				'font-size:{2};' +
				'text-align:{3};' +
				'leading:{4};' +
				'textIndent:{5}' +
				'}',
				_color.toString(16),
				_bold ? 'bold' : 'normal',
				_fontSize, _textAlign,
				_leading, _textIndent);
		}

		protected function attachStyleSheet():void
		{
			_styleSheet.parseCSS(formStyleStr());
			styleSheet = _styleSheet;
		}

		public function move(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
		}

		/**
		 * 不包括透明余白
		 * @param x
		 * @param y
		 *
		 */
		public function moveVisual(x:int, y:int):void
		{
			move(x - MARGIN, y - MARGIN);
		}

		protected var _widthSpecific:int = -1;
		protected var _heightSpecific:int = -1;

		public function setSizeSpecific(widthSpecific:int = -1, heightSpecific:int = -1):void
		{
			_widthSpecific = widthSpecific;
			_heightSpecific = heightSpecific;
		}

		protected var _textAlign:String;

		public function set textAlign(value:String):void
		{
			if (_textAlign != value)
			{
				_textAlign = value;
				attachStyleSheet();
			}
		}

		protected var _leading:int;

		public function set leading(value:int):void
		{
			if (_leading != value)
			{
				_leading = value;
				attachStyleSheet();
			}
		}

		protected var _textIndent:int;

		public function set textIndent(value:int):void
		{
			if (_textIndent != value)
			{
				_textIndent = value;
				attachStyleSheet();
			}
		}

		public static function setHVCenter(displayObj:DisplayObject, out_x:int, out_y:int, out_width:int, out_height:int):void
		{
			displayObj.x = out_x + (out_width - displayObj.width) / 2;
			displayObj.y = out_y + (out_height - displayObj.height) / 2;
		}
		
		public function set color(value:uint):void
		{
			if (_color != value)
			{
				_color = value;
				attachStyleSheet();
			}
		}
	}
}
