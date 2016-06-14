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
	public class Thorns extends Entity
	{
		
		private var sprSwordguy:Spritemap = new Spritemap(Res.SET, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
		private var _activeB:Boolean = false;
		private var _num:int = 0
		private var _boolDead:Boolean = false;
		public function Thorns(xPos:Number, yPos:Number, act:Boolean = false ) 
		{
			type = Opt.THORNS;
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			x = xPos;
			y = yPos;
			sprSwordguy.add("y", [12], 20, true);
			sprSwordguy.add("n", [13], 20, true);
			
			graphic = sprSwordguy;
			_activeB = act;
			//active = false;
			
			if (_activeB) 
			{
				sprSwordguy.play("n");
				_boolDead = true;
			}else {
				sprSwordguy.play("y");
			}
			
			//trace(type);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_activeB) 
			{
				if (_num<16) 
				{
					_num++;
				}else {
					_boolDead = true;
					sprSwordguy.play("n");	
				}
			}
			
		}
		public function reActive():void 
		{
			//sprSwordguy.play("n");	
			_activeB = true;			
		}
		
		public function get activeB():Boolean 
		{
			return _activeB;
		}
		
		public function set activeB(value:Boolean):void 
		{
			_activeB = value;
		}
		
		public function get boolDead():Boolean 
		{
			return _boolDead;
		}
		
		public function set boolDead(value:Boolean):void 
		{
			_boolDead = value;
		}
		
	}

}