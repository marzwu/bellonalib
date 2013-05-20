package org.marz.dijkstra.structs.graphs
{
	
	/**
	 * Graph class
	 * version: 0.1
	 * to-do:
	 * 	- add removeVertex()
	 * 	- add removeEdge()
	 * 	- implement graph traversal algorithms
	 */
	
	import org.marz.dijkstra.structs.linkedlists.LinkedList;
	
	public class Graph
	{
	
		private var _vertices:LinkedList;
		private var _vertexCount:uint;
		
		public function Graph()
		{
			_vertices = new LinkedList();
			_vertexCount = 0;
		}
		
		public function addVertex( vertex:Vertex ):void  
		{
			//_vertices.push( vertex, "vertex_" + _vertexCount );
			_vertices.append( vertex, vertex.name );
			_vertexCount++;
		}
		
		public function addEdge( u:Vertex, v:Vertex, weight:int = 1 ):Boolean
		{
			if ( u && v )
			{
				if ( u == v ) return false;
				u.addEdge( v, weight );
				v.addEdge( u, weight );
				//u.adjList.push( v, v.name );
				//v.adjList.push( u, u.name );
				return true;
			}
			return false;
		}
		
		public function get vertices():LinkedList
		{
			return _vertices;
		}
		
		public function get size():uint
		{
			return _vertexCount;
		}
		
		public function isEmpty():Boolean
		{
			return _vertexCount == 0;
		}
		
	}
	
}