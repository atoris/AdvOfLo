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
			for (var i:int = 0; i < GameWorld.arrDoor.length; i++) 
			{
				GameWorld.arrDoor[i].activeB = !GameWorld.arrDoor[j].activeB;	
				GameWorld.arrDoor[i].reActive();		
			}
				
			
			for (var j:int = 0; j < GameWorld.arrButton.length; j++) 
			{
				GameWorld.arrButton[j].activeB = !GameWorld.arrButton[j].activeB;
				GameWorld.arrButton[j].reActive();				
			}	
			trace("ON");
			
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
			trace("OFF");
		}
		
		
	}

}