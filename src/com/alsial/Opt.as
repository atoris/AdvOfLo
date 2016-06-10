package com.alsial  
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class Opt 
	{
		
		public static const SW:int = 800;
		public static const SH:int = 480;
		//public static const NULL:uint = 0;
		public static const WALL:String = "WALL";
		public static const PLAYER:String = "PLAYER";
		public static const GROUND:String = "GROUND";
		public static const BOX:String = "BOX";
		public static const STAR:String = "STAR";
		public static const ENEMY_EVIL:String = "ENEMY_EVIL";
		public static const LAVA:String = "LAVA";
		public static const STONE:String = "STONE";
		public static const DOR:String = "DOR";
		public static const TRIGGERBUTTON:String = "TRIGGERBUTTON";
		public static const TRIGGERDOOR:String = "TRIGEERDOOR";
		public static const THORNS:String = "THORNS";
		
		
		public static var ARR_OBJECT_ID:Array=new Array(ID_BOX,ID_ENEMY_EVIL,ID_GROUND,ID_PLAYER,ID_STAR,ID_STONE,ID_WALL);
		public static var ARR_OBJECT_NAME:Array= new Array(BOX,ENEMY_EVIL,GROUND,PLAYER,STAR,STONE,WALL);
		
		
		public static var maxStar:int;
		
		public static const ID_TRIGGERDOOR_OPEN:int = 10;
		public static const ID_TRIGGERDOOR_CLOSE:int = 11;
		public static const ID_TRIGGERBUTTON_OPEN:int = 12;
		public static const ID_TRIGGERBUTTON_CLOSE:int =11;
		public static const ID_STONE:int = 3;
		public static const ID_PLAYER:int = 9;
		public static const ID_WALL:int = 2;
		public static const ID_GROUND:int = 6;
		public static const ID_STAR:int = 7;
		public static const ID_BOX:int = 1;
		public static const ID_ENEMY_EVIL:int = 8;
		
		public static const SPEED:int = 4;
		
		public static var score:int = 0;
		public static var step:int = 0;
		
		public static var numStar:int = 0;
		
		public static var numLevel:int = 0;
		
		//public static const ARR_SOLID_STATIC:Array = new Array(WALL,GROUND,STAR);
		
		public function Opt() 
		{
			//ARR_OBJECT_ID = new Array(ID_BOX,ID_ENEMY_EVIL,ID_GROUND,ID_PLAYER,ID_STAR,ID_STONE,ID_WALL);
			//ARR_OBJECT_NAME = new Array(BOX,ENEMY_EVIL,GROUND,PLAYER,STAR,STONE,WALL);
		}
		
	}

}