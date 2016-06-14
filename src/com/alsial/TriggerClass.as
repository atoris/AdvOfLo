package com.alsial 
{
	import com.alsial.Entity.TriggerButton;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TriggerClass 
	{
		
		public function TriggerClass() 
		{
			
		}
		
		public function onActive():void 
		{	
			var bool:Boolean;
			for (var i:int = 0; i < GameWorld.arrDoor.length; i++) 
			{
				bool = GameWorld.arrDoor[i].bool;
				if (!bool) 
				{
					GameWorld.arrDoor[i].activeB = !GameWorld.arrDoor[j].activeB;	
					GameWorld.arrDoor[i].reActive();	
				}else{
					break;
				}
				
			}
				
			
			for (var j:int = 0; j < GameWorld.arrButton.length; j++) 
			{
				if (!bool) 
				{
					GameWorld.arrButton[j].activeB = !GameWorld.arrButton[j].activeB;
					GameWorld.arrButton[j].reActive();
				}								
			}
			trace(bool);
		}
	}
}