
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
		
		public function Box(xPos:Number=0, yPos:Number=0) 
		{
			graphic = new Image(Res.BOX);
			type = Opt.BOX;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;	
		}
		
		override public function update():void 
		{
			super.update();
			
			
			
		}
	}

}