
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
			
			_img = new Image(Res.BOX);
			graphic =_img;
			
			type = Opt.BOX;
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			x = xPos;
			y = yPos;	
		}
		
		override public function update():void 
		{
			super.update();
			
			
			
		}
	}

}