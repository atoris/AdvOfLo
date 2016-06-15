package com.alsial 
{
	import com.alsial.Entity.Box;
	import com.alsial.Entity.Elevator;
	import com.alsial.Entity.LevelPoint;
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
		private var _trigger:TriggerClass;
		
		private var _arrPoint:Array;
		public static var ARR_LEVEL:Array = new Array(	
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
			[1, 2, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 22, 22, 22, 22, 22, 0, 0, 0, 1],
			[1, 0, 0, 0, 6, 0, 0, 9, 0, 0, 0, 23, 23, 23, 23, 23, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 25, 24, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 24, 0, 1],
			[1, 0, 0, 0, 7, 0, 0, 8, 8, 0, 0, 0, 20, 0, 0, 0, 25, 24, 0, 1],
			[1, 0, 0, 0, 0, 4, 0, 8, 8, 0, 0, 0, 0, 0, 0, 0, 25, 24, 0, 1],
			[1, 0, 0, 0, 0, 5, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 25, 24, 0, 1],
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
			_trigger = new TriggerClass();
		}
		
		private function addTriggerEntity():void 
		{
			
			//arrDoor = new Array();
			//arrButton = new Array();
			_arrPoint = new Array();
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
						//arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL[i][j]==7) 
					{
						trb = new TriggerButton(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						//arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL[i][j]==8) 
					{
						var trd:TriggerDoor = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,true);
						//arrDoor.push(trd);
						add(trd);
					}
					if (ARR_LEVEL[i][j]==9) 
					{
						trd = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						//arrDoor.push(trd);
						add(trd);
					}
					if (ARR_LEVEL[i][j]==20) 
					{
						//trd = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						//arrDoor.push(trd);
						var lp:LevelPoint = new LevelPoint(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE);
						_arrPoint.push(lp);
						add(lp);
					}
					
					if (ARR_LEVEL[i][j]==22) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"L"));
					}
					if (ARR_LEVEL[i][j]==23) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"R"));
					}
					if (ARR_LEVEL[i][j]==24) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"D"));
					}
					if (ARR_LEVEL[i][j]==25) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"U"));
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
				Opt.ARR_LEVEL_POINTS[0] = _arrPoint[0].activeB;	
				Opt.ARR_LEVEL_POINTS[1] = _arrPoint[1].activeB;
				if ((Opt.ARR_LEVEL_POINTS[1]==Opt.ARR_LEVEL_POINTS[0])==true) 
				{
					trace("LEVEL_COMPLETE");
				}
				//trace(Opt.ARR_LEVEL_POINTS[0],Opt.ARR_LEVEL_POINTS[1]);
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