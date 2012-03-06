package com.adobe.dijkstra.structs.queues
{
	
	/**
	 * PriorityQueue class
	 * version: 0.1.1
	 * to-do:
	 * 	- implement fibonacci heap =)
	 * 	- implement Dictionary
	 */
	
	import com.adobe.dijkstra.structs.collections.ICollection;
	import com.adobe.dijkstra.structs.graphs.Vertex;
	
	public class PriorityQueue implements ICollection
	{

		private var _heap:Vector.<Prioritizable>;
		private var _size:uint;
		
		public function PriorityQueue()
		{
			_heap = new Vector.<Prioritizable>();
			_size = 0;
		}
		
		public function extractMin():Prioritizable
		{
			if ( _size )
			{
				var obj:Prioritizable = _heap[ 0 ];
				var min:int = obj.priority;
				var index:int;
				
				for ( var i:int = 0; i < _size; i++ )
				{
					if ( _heap[ i ].priority < min )
					{
						obj = _heap[ i ] as Prioritizable;
						min = obj.priority;
						index = i;
					}
				}
				_heap.splice( index, 1 );
				_size--; 
				return obj;
			}
			return null;
		}
		
		public function enqueue( obj:Prioritizable ):void
		{
			_heap.push( obj );
			_size++;	
		}
		
		public function isEmpty():Boolean
		{
			return _size == 0;
		}
		
		public function get size():uint
		{
			return _size;
		}

	}
	
}