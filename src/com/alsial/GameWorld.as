package com.alsial 
{
	import com.alsial.Entity.Box;
	import com.alsial.Entity.Elevator;
	import com.alsial.Entity.Floor;
	import com.alsial.Entity.LevelPoint;
	import com.alsial.Entity.NPCEntity1;
	import com.alsial.Entity.Player;
	import com.alsial.Entity.Plumb;
	import com.alsial.Entity.PointBox;
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
		
		private var _levels:Levels;
		private var _trigger:TriggerClass;
		
		private var _arrPoint:Array;
		
		public static var ARR_LEVEL_ENTITY:Array = new Array()
		
		
		public static var ARR_LEVEL_WALL:Array = new Array(	);
		public function GameWorld() 
		{
			super();	
			new Opt();
			Opt.numStar = 0;
			_levels = new Levels();
			ARR_LEVEL_ENTITY = _levels.arrLevelEntity;
			ARR_LEVEL_WALL = _levels.arrLevelWall;
			
			FP.console.enable();
			FP.console.toggleKey = Key.TAB;
			createLevel();
			
		}
		
		private function createLevel():void 
		{
			add(new Wall());
			add(new Floor());
			add(new Plumb());
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
			for (var i:int = 0; i < ARR_LEVEL_ENTITY.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL_ENTITY[i].length; j++) 
				{
					
					if (ARR_LEVEL_ENTITY[i][j]==26) 
					{						
						add(new Thorns(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					if (ARR_LEVEL_ENTITY[i][j]==24) 
					{
						var trb:TriggerButton = new TriggerButton(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,true);
						//arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL_ENTITY[i][j]==25) 
					{
						trb = new TriggerButton(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						//arrButton.push(trb);
						add(trb);
					}
					if (ARR_LEVEL_ENTITY[i][j]==22) 
					{
						var trd:TriggerDoor = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,true);
						//arrDoor.push(trd);
						add(trd);
					}
					if (ARR_LEVEL_ENTITY[i][j]==23) 
					{
						trd = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						//arrDoor.push(trd);
						add(trd);
					}
					if (ARR_LEVEL_ENTITY[i][j]==28) 
					{
						//trd = new TriggerDoor(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,false);
						//arrDoor.push(trd);
						var lp:LevelPoint = new LevelPoint(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE);
						_arrPoint.push(lp);
						add(lp);
					}
					
					if (ARR_LEVEL_ENTITY[i][j]==16 || ARR_LEVEL_ENTITY[i][j]==17) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"L"));
					}
					if (ARR_LEVEL_ENTITY[i][j]==14 || ARR_LEVEL_ENTITY[i][j]==15) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"R"));
					}
					if (ARR_LEVEL_ENTITY[i][j]==18 || ARR_LEVEL_ENTITY[i][j]==19) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"D"));
					}
					if (ARR_LEVEL_ENTITY[i][j]==20 || ARR_LEVEL_ENTITY[i][j]==21) 
					{
						add(new Elevator(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,"U"));
					}
					
					if (ARR_LEVEL_ENTITY[i][j]==80) 
					{
						add(new PointBox(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
						Opt.numStar++;
					}
					trace(Opt.numStar);
				}
			}
		}
		
		private function addStaticEntity():void 
		{
			for (var i:int = 0; i < ARR_LEVEL_ENTITY.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL_ENTITY[i].length; j++) 
				{
					
					if (ARR_LEVEL_ENTITY[i][j]==3) 
					{
						add(new Box(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					/*if (ARR_LEVEL_ENTITY[i][j]==4) 
					{
						Opt.numStar++;
						add(new Star(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE));
					}
					*/
					
				}
			}
		}
		
		private function addDynamicEntity():void 
		{
			arrPlayer = new Array();
			for (var i:int = 0; i < ARR_LEVEL_ENTITY.length; i++) 
			{
				for (var j:int = 0; j < ARR_LEVEL_ENTITY[i].length; j++) 
				{
					if (ARR_LEVEL_ENTITY[i][j]==1) 
					{
						var plr:Player = new Player(j * Opt.SIZE_CAGE, i * Opt.SIZE_CAGE,Opt.PLAYER_SMALL);
						arrPlayer.push(plr);
						add(plr);
					}
					if (ARR_LEVEL_ENTITY[i][j]==2) 
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
				//var bp:Boolean=(=Opt.ARR_LEVEL_POINTS[0])
				if (Opt.ARR_LEVEL_POINTS[1]&&Opt.ARR_LEVEL_POINTS[0]) 
				{
					FP.world.removeAll();
					FP.world = new GameOver();
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
			if (Input.pressed(Key.R)) 
				{
					FP.world.removeAll();
					FP.world = new GameOver();
				}
		}
		
	}

}