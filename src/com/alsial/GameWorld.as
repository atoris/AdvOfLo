package com.alsial 
{
	import com.alsial.Entity.Box;
	import com.alsial.Entity.Player;
	import com.alsial.Entity.Star;
	import com.alsial.Entity.Thorns;
	import com.alsial.Entity.TriggerButton;
	import com.alsial.Entity.TriggerDoor;
	import com.alsial.Entity.Wall;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class GameWorld extends World 
	{
		
		
		public static var arrDoor:Array;
		public static var arrButton:Array;
		public static var ARR_LEVEL:Array = new Array(	
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
			[1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 4, 0, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 4, 5, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 5, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
			);
		public function GameWorld() 
		{
			super();		
			
			createLevel();
			
		}
		
		private function createLevel():void 
		{
			add(new Wall());
			
			addTriggerEntity();
			addStaticEntity();
			addDynamicEntity();
			
			
			
		}
		
		private function addTriggerEntity():void 
		{
			
			arrDoor = new Array();
			arrButton = new Array();
			for (var i:int = 0; i < ARR_LEVEL.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL[i].length; j++) 
				{
					
					if (ARR_LEVEL[i][j]==5) 
					{						
						add(new Thorns(j * 32, i * 32));
					}
					if (ARR_LEVEL[i][j]==6) 
					{
						var trb:TriggerButton = new TriggerButton(j * 32, i * 32);
						arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL[i][j]==7) 
					{
						var trd:TriggerDoor = new TriggerDoor(j * 32, i * 32);
						arrDoor.push(trd);
						add(trd);
					}
				}
			}
		}
		
		private function addStaticEntity():void 
		{
			for (var i:int = 0; i < ARR_LEVEL.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL[i].length; j++) 
				{
					
					if (ARR_LEVEL[i][j]==3) 
					{
						add(new Box(j * 32, i * 32));
					}
					if (ARR_LEVEL[i][j]==4) 
					{
						Opt.numStar++;
						add(new Star(j * 32, i * 32));
					}
					
					
				}
			}
		}
		
		private function addDynamicEntity():void 
		{
			for (var i:int = 0; i < ARR_LEVEL.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL[i].length; j++) 
				{
					if (ARR_LEVEL[i][j]==2) 
					{
						add(new Player(j * 32, i * 32));
					}
					
				}
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Opt.numStar==0) 
			{
				trace("LEVEL COMPLETE");
			}
		}
		
	}

}