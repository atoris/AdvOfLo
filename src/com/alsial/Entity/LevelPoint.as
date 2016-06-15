package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import com.alsial.CollideEntity;
	import com.alsial.Opt;
	import com.alsial.Res;
	/**
	 * ...
	 * @author Atoris
	 */
	public class LevelPoint extends Entity
	{
		private var _img:Image;
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
		private var _activeB:Boolean;
		private var _collide:CollideEntity;
		public function LevelPoint(xPos:int=0,yPos:int=0) 
		{
			super(xPos, yPos);
			type = Opt.LEVEL_POINTS;
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			sprSwordguy.add("N", [19], 20, true);
			graphic = sprSwordguy;
			_collide = new CollideEntity(this, [Opt.PLAYER_SMALL, Opt.PLAYER]);
			sprSwordguy.play("N");	
			_activeB = false;
		}
		
		override public function update():void 
		{
			super.update();
			if (_collide.getPush()) 
			{
				_activeB = true;
			}else{
				_activeB = false;
			}
		}
		
		
		public function get activeB():Boolean 
		{
			return _activeB;
		}
		
		public function set activeB(value:Boolean):void 
		{
			_activeB = value;
		}
		
	}

}