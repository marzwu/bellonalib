package com.marz.ui.control
{
	import flash.text.TextField;

	public class SealedTextField extends TextField
	{
		static public var defaultHeight:int = 19;

		public function SealedTextField(bMultiline:Boolean = true)
		{
			super();

			/**几个一般都会设置的属性*/
//			mouseEnabled = false;
			selectable = false;
			multiline = bMultiline;
			if (!bMultiline)
				height = defaultHeight;
		}
	}
}
