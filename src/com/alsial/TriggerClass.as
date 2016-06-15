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
		public function TriggerClass() 
		{
			
		}
		
		public function onActive():void 
		{	
			var bool:Boolean;
			_arrDoor = new Array();
			_arrButton = new Array();
			
			
			FP.world.getType(Opt.TRIGGERDOOR, _arrDoor);
			FP.world.getType(Opt.TRIGGERBUTTON, _arrButton);
			for (var i:int = 0; i < _arrDoor.length; i++) 
			{
				_arrDoor[i].reActive();
			}
			for (var j:int = 0; j < _arrButton.length; j++) 
			{
				_arrButton[j].reActive();
			}
			trace(_arrDoor.length,_arrButton.length);
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