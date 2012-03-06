package com.adobe.dijkstra.structs.graphs
{
	/**
	 * Dijkstra's algorithm class
	 * version: 0.1.3
	 */
	 
	import com.adobe.dijkstra.structs.linkedlists.ListNode;
	import com.adobe.dijkstra.structs.queues.PriorityQueue;

	public class Dijkstra
	{
		private var _graph:Graph;
		private var _src:Vertex;
		private var _dest:Vertex;
		private var _queue:PriorityQueue;
		
		public function Dijkstra( graph:Graph = null, src:Vertex = null, dest:Vertex = null)
		{
			_graph = graph;
			_src = src;
			_dest = dest;
			//_queue = new PriorityQueue();
		}
		
		public function search():Vertex
		{
			_queue = new PriorityQueue();
			
			var u:Vertex;
			var v:Vertex;
			var i:int;
			
			_graph.vertices.forEach( addToQueue );
			_src.weight = 0;
			while ( !_queue.isEmpty() )
			{
				if ( ( u = _queue.extractMin() as Vertex ) == null )
					break;
				if ( u == _dest )
					return _dest;
				i = 0;
				while ( i < u.edgeCount )
				{
					v = u.edges[ i ].dest;
					if ( v.visited ) { i++; continue; }
					if ( v.weight > ( u.weight + u.edges[ i ].cost ) )
					{
						v.weight = u.weight + u.edges[ i ].cost;
						v.parent = u;
					}
					i++;
				}
				u.visited = true;
			}
			return null;
		}
		
		private function addToQueue( node:ListNode ):void
		{
			var v:Vertex = node.data as Vertex;
			v.weight = int.MAX_VALUE;
			v.visited = false;
			v.parent = null;
			_queue.enqueue( v );
		}
		
		public function get graph():Graph
		{
			return _graph;
		}
		public function set graph(value:Graph):void
		{
			_graph = value;
		}
		public function set src(value:Vertex):void
		{
			_src = value;
		}
		public function set dest(value:Vertex):void
		{
			_dest = value;
		}
	}
}