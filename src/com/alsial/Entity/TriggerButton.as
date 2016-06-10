package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import com.alsial.Res;
	import com.alsial.Opt;
	import net.flashpunk.graphics.Spritemap;
	import com.alsial.GameWorld;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TriggerButton extends Entity
	{
		private var _img:Image;
		public var activeB:Boolean;
		public var _bool:Boolean;
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, 32, 32);
		public function TriggerButton(xPos:Number = 0, yPos:Number = 0, active:Boolean = true ) 
		{
			activeB = active;
			sprSwordguy.add("y", [14], 20, true);
			sprSwordguy.add("n", [15], 20, true);
			graphic = sprSwordguy;
			if (activeB) 
			{
				sprSwordguy.play("y");
			}else {
				sprSwordguy.play("n");	
			}
			active = false;
			
			type = Opt.TRIGGERBUTTON;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;
			
		}
		
		
		override public function update():void 
		{
			super.update();
			
		}
		
		public function reActive():void 
		{
			
			if (activeB) 
			{
				sprSwordguy.play("y");
			}else {
				sprSwordguy.play("n");
			}			
			
		}
		
	}

}