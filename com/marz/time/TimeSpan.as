package com.adobe.utils
{
	/**
	 * 时间间隔，
	 * var ts:TimeSpan = DateUtil.getSpan(date1, date2);
	 * @author Marz
	 * 
	 */	
	public class TimeSpan
	{
		private var _days:int;//总天数，向下取整
		private var _hours:int;//不足一天的小时数，向下取整
		private var _minutes:int;//不足一小时的分钟数，向下取整
		private var _seconds:int;//不足一分钟的秒数，向下取整
		private var _millisenconds:int;//不足一秒的毫秒数，向下取整
		private var _ticks:int;//闲置，flash没有那么精致
		
		private var _totalMilliseconds:int;//总的毫秒数
		
		/**
		 * 以毫秒初始化之
		 * @param ms milliseconds
		 * 
		 */		
		public function TimeSpan(ms:int)
		{
			setTotalMilliseconds(ms);
		}
		
		protected function setTotalMilliseconds(value:int):void
		{
			_totalMilliseconds = value;
			
			_millisenconds = value % 1000;
			value /= 1000;
			
			_seconds = value % 60;
			value /= 60;
			
			_minutes = value % 60;
			value /= 60;
			
			_hours = value % 24;
			value /= 24;
			
			_days = value;
		}
		
		public function add(ms:int):TimeSpan
		{
			setTotalMilliseconds(_totalMilliseconds + ms);
			return this;
		}
		
		public function subtract(ms:int):TimeSpan
		{
			setTotalMilliseconds(_totalMilliseconds - ms);
			return this;
		}
		
		public function getTotalHours():Number
		{
			return _totalMilliseconds / 3600, 000;//60 * 60 * 1000
		}
		
		public static var charDD:String = '.';
		public static var charHH:String = ':';
		public static var charMM:String = ':';
		public static var charSS:String = '.';
		
		public function toString():String
		{
			var str:String = '';
			
			if(_days > 0)
				str += _days + charDD;
			
			if(_hours < 10)
				str += '0';
			str += _hours + charHH;
			if(_minutes < 10)
				str += '0';
			str += _minutes + charMM;
			if(_seconds < 10)
				str += '0';
			str += _seconds;
			
			return str;
		}
		
		public static function fromMilliseconds(ms:int):TimeSpan
		{
			return new TimeSpan(ms);
		}
		
		public function getTotalSeconds():Number
		{
			return _totalMilliseconds / 1000;
		}
		
		public function getTime():int
		{
			return _totalMilliseconds;
		}
	}
}