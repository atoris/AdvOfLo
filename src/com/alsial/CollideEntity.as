package com.alsial 
{
	import com.alsial.Entity.Box;
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Atoris
	 */
	public class CollideEntity 
	{
		private var _type:String;
		private var ent:Entity;
		private var arr:Array;
		private var _entity:Entity;
		private var _pos:String;
		public function CollideEntity(ent:Entity,arr:Array) 
		{
			this.ent = ent;
			this.arr = arr;
		}
		
		public function getLeft(dist:int=1):Entity 
		{
			var bool:Boolean = false;
			
			
			_type = "null";
			
			for (var i:int = 0; i < arr.length; i++) 
			{
				_entity = ent.collide(arr[i], ent.x - dist, ent.y);
				if (_entity) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			_pos = "LEFT";
			//trace(entity is Box);
			return _entity;
		}
		
		public function getRight(dist:int=1):Entity 
		{
			var bool:Boolean = false;
			_type = "null";
			
			for (var i:int = 0; i < arr.length; i++) 
			{
				_entity = ent.collide(arr[i], ent.x + dist, ent.y);
				if (_entity) 
				{
					
					_type = arr[i];
					bool = true;
					break;
				}
			}
			_pos = "RIGHT";
			return _entity;
		}
		
		public function getDown(dist:int=1):Entity 
		{
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				_entity = ent.collide(arr[i], ent.x, ent.y + dist);
				if (_entity) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			_pos = "DOWN";
			return _entity;
		}
		public function getUp(dist:int=1):Entity 
		{
			
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				_entity = ent.collide(arr[i], ent.x, ent.y - dist);
				if (_entity) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			_pos = "UP";
			return _entity;
		}
		
		public function getPush():Entity 
		{
			
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				_entity = ent.collide(arr[i], ent.x, ent.y);
				if (_entity) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			_pos = "PUSH";
			return _entity;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get entity():Entity 
		{
			return _entity;
		}
		
		public function get pos():String 
		{
			return _pos;
		}
		
	}

}