
package com.alsial.Entity  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import com.alsial.Opt;
	import com.alsial.Res;
	
	import com.alsial.TriggerClass;
	/**
	 * ...
	 * @author ...
	 */
	public class Box extends StaticEntity
	{
		
		
		private var _trigger:TriggerClass;
		public function Box(xPos:Number=0, yPos:Number=0) 
		{
			graphic = new Image(Res.BOX);
			type = Opt.BOX;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;	
			_trigger = new TriggerClass();
		}
		
		override public function update():void 
		{
			super.update();
			
			
			var triggerButton:TriggerButton = (collide(Opt.TRIGGERBUTTON, x, y)) as TriggerButton;
			//trace(triggerButton);
			if (triggerButton) 
			{
				_trigger.onActive();
			}else{
				_trigger.offActive();
			}
		}
	}

}