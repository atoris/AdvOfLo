package com.alsial 
{
	import com.alsial.Entity.TriggerButton;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TriggerClass 
	{
		private var _arrDoor:Array;
		private var _arrButton:Array;
		private var _arrElevatorL:Array;
		private var _arrElevatorR:Array;
		private var _arrElevatorD:Array;
		private var _arrElevatorU:Array;
		public function TriggerClass() 
		{
			
		}
		
		public function onActive():void 
		{	
			var bool:Boolean;
			_arrDoor = new Array();
			_arrButton = new Array();
			_arrElevatorL = new Array();
			_arrElevatorR = new Array();
			_arrElevatorD = new Array();
			_arrElevatorU = new Array();
			
			FP.world.getType(Opt.TRIGGERDOOR, _arrDoor);
			FP.world.getType(Opt.TRIGGERBUTTON, _arrButton);
			
			
			FP.world.getType(Opt.EL_RIGHT, _arrElevatorR);
			FP.world.getType(Opt.EL_LEFT, _arrElevatorL);
			FP.world.getType(Opt.EL_DOWN, _arrElevatorD);
			FP.world.getType(Opt.EL_UP, _arrElevatorU);
			for (var i:int = 0; i < _arrDoor.length; i++) 
			{
				_arrDoor[i].reActive();
			}
			for (var j:int = 0; j < _arrButton.length; j++) 
			{
				_arrButton[j].reActive();
			}
			for (var k:int = 0; k < _arrElevatorL.length; k++) 
			{
				_arrElevatorL[k].reActive();
			}
			for (var l:int = 0; l < _arrElevatorR.length; l++) 
			{
				_arrElevatorR[l].reActive();
			}
			for (var m:int = 0; m < _arrElevatorU.length; m++) 
			{
				_arrElevatorU[m].reActive();
			}
			for (var n:int = 0; n < _arrElevatorD.length; n++) 
			{
				_arrElevatorD[n].reActive();
			}
			
			/*
			for (var i:int = 0; i < GameWorld.arrDoor.length; i++) 
			{
				bool = GameWorld.arrDoor[i].bool;
				//if (!bool) 
				//{
					GameWorld.arrDoor[i].activeB = !GameWorld.arrDoor[j].activeB;	
					GameWorld.arrDoor[i].reActive();	
				//}
				
			}
				
			
			for (var j:int = 0; j < GameWorld.arrButton.length; j++) 
			{
				//if (!bool) 
				//{
					GameWorld.arrButton[j].activeB = !GameWorld.arrButton[j].activeB;
					GameWorld.arrButton[j].reActive();
				//}								
			}
			//trace(bool);*/
		}
	}
}