package com.alsial 
{
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
		public function CollideEntity(ent:Entity,arr:Array) 
		{
			this.ent = ent;
			this.arr = arr;
		}
		
		public function getLeft():Boolean 
		{
			var bool:Boolean = false;
			
			
			_type = "null";
			
			for (var i:int = 0; i < arr.length; i++) 
			{
				if (ent.collide(arr[i], ent.x - 1, ent.y)) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			return bool;
		}
		
		public function getRight():Boolean 
		{
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				if (ent.collide(arr[i], ent.x + 1, ent.y)) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			return bool;
		}
		
		public function getDown():Boolean 
		{
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				if (ent.collide(arr[i], ent.x, ent.y+1)) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			return bool;
		}
		public function getUp():Boolean 
		{
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				if (ent.collide(arr[i], ent.x, ent.y-1)) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			return bool;
		}
		
		public function getPush():Boolean 
		{
			var bool:Boolean = false;
			_type = "null";
			for (var i:int = 0; i < arr.length; i++) 
			{
				if (ent.collide(arr[i], ent.x, ent.y)) 
				{
					_type = arr[i];
					bool = true;
					break;
				}
			}
			return bool;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
	}

}