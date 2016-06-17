package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import com.alsial.Res;
	import net.flashpunk.graphics.Spritemap;
	import com.alsial.Opt;
	/**
	 * ...
	 * @author Atoris
	 */
	public class PointBox extends Entity
	{
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
		
		
		public function PointBox(xPos:int,yPos:int) 
		{
			type = Opt.POINT_BOX;
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			x = xPos;
			y = yPos;
			sprSwordguy.add("y", [80], 20, true);
			sprSwordguy.play("y");
			//trace(x,y);
			active = false;
			graphic = sprSwordguy;			
		}
		override public function update():void 
		{
			super.update();	
			
			
			
		}
		
	}

}