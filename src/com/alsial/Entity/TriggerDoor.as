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
		public var activeB:Boolean=true;
		private var _img:Image;
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, 32, 32);
		private var _bool:Boolean;
		
		
		
		public function TriggerDoor(xPos:Number,yPos:Number,b:Boolean) 
		{
			trace(b);
			type = Opt.TRIGGERDOOR;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;
			//active = false;
			sprSwordguy.add("N", [10], 20, true);
			sprSwordguy.add("Y", [11], 20, true);
			graphic = sprSwordguy;
			activeB = b;
			if (activeB) 
			{
				sprSwordguy.play("Y");
			}else{
				sprSwordguy.play("N");
			}
			
			//sprSwordguy.play( (activeB)?"Y":"N");
		}
		
		public function reActive():void 
		{
			
			sprSwordguy.play( (activeB)?"Y":"N");			
			
		}
		
		
		
	}

}