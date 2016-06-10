package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import com.alsial.Opt;
	import net.flashpunk.utils.Draw;
	import flash.display.Sprite;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import com.alsial.Res;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TriggerDoor extends Entity
	{
		public var activeB:Boolean;
		private var _img:Image;
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, 32, 32);
		private var _bool:Boolean;
		
		
		public function TriggerDoor(xPos:Number,yPos:Number,active:Boolean=true) 
		{
			type = Opt.TRIGGERDOOR;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;
			
			sprSwordguy.add("y", [10], 20, true);
			sprSwordguy.add("n", [11], 20, true);
			graphic = sprSwordguy;
			
			//active = false;
			
			if (activeB) 
			{
				sprSwordguy.play("y");
				
			}else {
				sprSwordguy.play("n");
			}
			
		}
		
		public function reActive():void 
		{
			
			if (activeB) 
			{
				trace("xxx");
				sprSwordguy.play("y");
			}else {
				trace("yyy");
				sprSwordguy.play("n");
			}			
			
		}
		
		
		
	}

}