package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import com.alsial.Res;
	import com.alsial.Opt;
	import net.flashpunk.graphics.Spritemap;
	import com.alsial.GameWorld;
	import com.alsial.TriggerClass;
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
		private var _trigger:TriggerClass;
		public function TriggerButton(xPos:Number, yPos:Number, b:Boolean) 
		{
			sprSwordguy.add("Y", [14], 20, true);
			sprSwordguy.add("N", [15], 20, true);
			graphic = sprSwordguy;
			activeB = b;
			sprSwordguy.play((activeB)?"Y":"N");
			
			
			type = Opt.TRIGGERBUTTON;
			setHitbox(32, 32);
			x = xPos;
			y = yPos;
			_trigger = new TriggerClass();
			
		}
		
		
		override public function update():void 
		{
			super.update();
			
			var player:Player = collide(Opt.PLAYER, x, y) as Player;
			//var box:Box = collide(Opt.BOX, x, y) as Box;
			
			
			if (activeB && player) 
			{
				//trace("xxx");
				_trigger.onActive();
				activeB = false;
			}
		}
		
		public function reActive():void 
		{
			
			if (activeB) 
			{
				sprSwordguy.play("Y");
			}else {
				sprSwordguy.play("N");
			}			
			
		}
		
	}

}