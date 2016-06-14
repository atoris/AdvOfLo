package com.alsial 
{
	import com.alsial.Entity.Box;
	import com.alsial.Entity.NPCEntity1;
	import com.alsial.Entity.Player;
	import com.alsial.Entity.Star;
	import com.alsial.Entity.Thorns;
	import com.alsial.Entity.TriggerButton;
	import com.alsial.Entity.TriggerDoor;
	import com.alsial.Entity.Wall;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class GameWorld extends World 
	{
		
		
		public static var arrDoor:Array;
		public static var arrButton:Array;
		public static var arrPlayer:Array;
		public static var ARR_LEVEL:Array = new Array(	
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
			[1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 6, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 7, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 5, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
			);
		public function GameWorld() 
		{
			super();		
			FP.console.enable();
			FP.console.toggleKey = Key.TAB;
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
						add(new Thorns(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					if (ARR_LEVEL[i][j]==6) 
					{
						var trb:TriggerButton = new TriggerButton(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,true);
						arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL[i][j]==7) 
					{
						trb = new TriggerButton(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL[i][j]==8) 
					{
						var trd:TriggerDoor = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,true);
						arrDoor.push(trd);
						add(trd);
					}
					if (ARR_LEVEL[i][j]==9) 
					{
						trd = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
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
						add(new Box(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					if (ARR_LEVEL[i][j]==4) 
					{
						Opt.numStar++;
						add(new Star(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					
					
				}
			}
		}
		
		private function addDynamicEntity():void 
		{
			arrPlayer = new Array();
			for (var i:int = 0; i < ARR_LEVEL.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL[i].length; j++) 
				{
					if (ARR_LEVEL[i][j]==2) 
					{
						var plr:Player = new Player(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,Opt.PLAYER_SMALL);
						arrPlayer.push(plr);
						add(plr);
					}
					if (ARR_LEVEL[i][j]==10) 
					{
						plr = new Player(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE);
						arrPlayer.push(plr);
						add(plr);
						//add(new NPCEntity1(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					
				}
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Opt.numStar==0) 
			{
				//trace("LEVEL COMPLETE");
			}
			
			if (Input.pressed(Key.X)) 
			{
				for (var i:int = 0; i < arrPlayer.length; i++) 
				{
					var plr:Player = arrPlayer[i];
					
					plr.playerB = !arrPlayer[i].playerB;
					plr.mLeft = false;
					plr.mRight = false;
					plr.mDown = false;
					plr.mUp = false;
					//plr.resize();
					
				}
				trace("------------------");
				//trace("xxx");
			}
		}
		
	}

}