package org.bellona.dijkstra.structs.graphs
{
	
	/**
	 * Basic graph vertex
	 * version: 0.2
	 */
	
	import __AS3__.vec.Vector;
	
	import org.bellona.dijkstra.structs.queues.Prioritizable;
	
	public class Vertex extends Prioritizable
	{
				
		private var _parent:Vertex;
		private var _weight:int;
		private var _edges:Vector.<GraphEdge>;
		private var _edgeCount:uint;
		private var _visited:Boolean = false;
		public var name:String;
		
		public function Vertex( name:String = "" )
		{
			_edges = new Vector.<GraphEdge>();
			_edgeCount = 0;
			this.name = name;
		}
		
		public function addEdge( v:Vertex, weight:int ):void
		{
			_edges[ _edgeCount ] = new GraphEdge( v, weight );
			_edgeCount++
		}

		public function get parent():Vertex
		{
			return _parent;
		}
		public function set parent( parent:Vertex ):void
		{
			_parent = parent;
		}
		
		public function get edgeCount():uint
		{
			return _edgeCount;
		}
		
		public function get edges():Vector.<GraphEdge>
		{
			return _edges;
		}
		
		public function get weight():int
		{
			return _weight;
		}
		
		public function set weight( weight:int ):void
		{
			_weight = weight;
		}
		
		override public function get priority():int
		{
			return _weight;
		}
		
		override public function set priority( priority:int ):void
		{
			_weight = priority;
		}

		public function set visited( visited:Boolean ):void
		{
			_visited = visited;
		}
		
		public function get visited():Boolean
		{
			return _visited;
		}
	
	}
	
}