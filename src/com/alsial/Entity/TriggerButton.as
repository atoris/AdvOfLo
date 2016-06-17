package com.alsial.Entity 
{
	import com.alsial.CollideEntity;
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
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
		private var _trigger:TriggerClass;
		
		private var _collide:CollideEntity;
		public function TriggerButton(xPos:Number, yPos:Number, b:Boolean) 
		{
			sprSwordguy.add("Y", [24], 20, true);
			sprSwordguy.add("N", [25], 20, true);
			graphic = sprSwordguy;
			activeB = b;
			sprSwordguy.play((activeB)?"Y":"N");
			
			_collide = new CollideEntity(this, [Opt.PLAYER, Opt.PLAYER_SMALL]);
			type = Opt.TRIGGERBUTTON;
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			x = xPos;
			y = yPos;
			_trigger = new TriggerClass();
			
		}
		
		
		override public function update():void 
		{
			super.update();
			if (activeB && _collide.getPush()) 
			{
				_trigger.onActive();
				activeB = false;
			}
		}
		
		public function reActive():void 
		{		
			activeB = !activeB;
			sprSwordguy.play( (activeB)?"Y":"N");				
		}
		
	}

}