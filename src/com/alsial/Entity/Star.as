package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import com.alsial.Res;
	import com.alsial.Opt;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Star extends Entity
	{
		
		public function Star(xPos:int,yPos:int) 
		{
			graphic = new Image(Res.STAR);
			type = Opt.STAR;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;
			
		}
		
		public function destroy():void 
		{
			Opt.numStar--;
			FP.world.remove(this);
		}
		
	}

}