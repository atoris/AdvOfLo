package com.alsial.Entity 
{
	import com.alsial.CollideEntity;
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
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
		private var _bool:Boolean;
		private var _collide:CollideEntity;
		
		public function TriggerDoor(xPos:Number,yPos:Number,b:Boolean) 
		{
			super(xPos, yPos);
			type = Opt.TRIGGERDOOR;
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			sprSwordguy.add("N", [10], 20, true);
			sprSwordguy.add("Y", [11], 20, true);
			graphic = sprSwordguy;
			activeB = b;
			_collide = new CollideEntity(this, [Opt.PLAYER_SMALL, Opt.BOX]);
			sprSwordguy.play( (activeB)?"Y":"N");	
			//sprSwordguy.play( (activeB)?"Y":"N");
		}
		
		
		
		override public function update():void 
		{
			super.update();	
			
			_bool = _collide.getPush()?true:false;
			trace(_bool);
		}
		
		public function reActive():void 
		{
			
			sprSwordguy.play( (activeB)?"Y":"N");			
			
		}
		
		public function get bool():Boolean 
		{
			return _bool;
		}
	}

}