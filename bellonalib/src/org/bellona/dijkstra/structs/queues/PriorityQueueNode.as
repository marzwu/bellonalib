package org.bellona.dijkstra.structs.queues
{
	
	/**
	 * Priority Queue Node class
	 * version: 0.1
	 */
	
	public class PriorityQueueNode extends Prioritizable
	{
		private var _name:String;
		
		public function PriorityQueueNode( priority:int = 0, name:String = "" )
		{
			_priority = priority;
			_name = name;
		}

		public function get name():String
		{
			return _name;
		}

		override public function get priority():int
		{
			return _priority;
		}
		
		override public function set priority( priority:int ):void
		{
			_priority = priority;
		}
		
	}
	
}