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
			//trace(GameWorld.arrDoor.length);
			for (var i:int = 0; i < GameWorld.arrDoor.length; i++) 
			{
				GameWorld.arrDoor[i].activeB = true;	
				GameWorld.arrDoor[i].reActive();		
			}
				
			
			for (var j:int = 0; j < GameWorld.arrButton.length; j++) 
			{
				GameWorld.arrButton[j].activeB = true;
				GameWorld.arrButton[j].reActive();				
			}	
			
		}
		public function offActive():void 
		{
			for (var i:int = 0; i < GameWorld.arrDoor.length; i++) 
			{
				GameWorld.arrDoor[i].activeB = false;	
				GameWorld.arrDoor[i].reActive();			
			}
			for (var j:int = 0; j < GameWorld.arrButton.length; j++) 
			{
				//GameWorld.arrButton[j].activeB = false;
				//GameWorld.arrButton[j].reActive();				
						
			}
		}
		
		
	}

}