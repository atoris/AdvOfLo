package com.alsial  
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class Opt 
	{
		
		public static const SW:int 			= 800;
		public static const SH:int 			= 480;
		
		public static const WALL:String 		= "WALL";
		public static const PLAYER:String 		= "PLAYER";
		public static const PLAYER_SMALL:String 	= "PLAYER_SMALL";
		public static const BOX:String 			= "BOX";
		public static const STAR:String 		= "STAR";
		public static const ENEMY_EVIL:String 	= "ENEMY_EVIL";
		public static const TRIGGERBUTTON:String 	= "TRIGGERBUTTON";
		public static const TRIGGERDOOR:String 	= "TRIGEERDOOR";
		public static const THORNS:String 		= "THORNS";
		public static const LEVEL_POINTS:String 	= "LEVEL_POINTS";
		public static const EL_RIGHT:String		= "EL_RIGHT";
		public static const EL_DOWN:String		= "EL_DOWN";
		public static const EL_LEFT:String		= "EL_LEFT";
		public static const EL_UP:String		= "EL_UP";
		
		
		
		public static const SPEED:int 			= 4;		
		public static var score:int 			= 0;
		public static var numStar:int 			= 0;		
		public static var numLevel:int 			= 0;
		public static const SIZE_CAGE:int 		= 32;
		
		public static var ARR_LEVEL_POINTS:Array = new Array(false,false);
		public function Opt() 
		{
		}
		
	}

}