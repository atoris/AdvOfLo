package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import com.alsial.Res;
	import com.alsial.Opt;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Elevator extends Entity
	{
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
		
		public function Elevator(xPos:int,yPos:int, str:String) 
		{
			
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			x = xPos;
			y = yPos;
			sprSwordguy.add("L", [22], 20, true);
			sprSwordguy.add("R", [23], 20, true);
			sprSwordguy.add("D", [24], 20, true);
			sprSwordguy.add("U", [25], 20, true);
			if (str=="L") 
			{
				type = Opt.EL_LEFT;
			}
			if (str=="R") 
			{
				type = Opt.EL_RIGHT;
			}
			if (str=="D") 
			{
				type = Opt.EL_DOWN;
			}
			if (str=="U") 
			{
				type = Opt.EL_UP;
			}
			sprSwordguy.play(str);
			graphic = sprSwordguy;			
		}
		
		public function getLeft():int{
			return 0;
		}
		
		
	}

}