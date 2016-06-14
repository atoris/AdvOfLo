package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import com.alsial.Res;
	import com.alsial.Opt;
	import net.flashpunk.graphics.Image;
	import com.alsial.StepGame;
	/**
	 * ...
	 * @author Atoris
	 */
	public class NPCEntity1 extends Entity
	{
		private var _path:String;
		
		private var _left:Boolean;
		private var _right:Boolean;
		private var _up:Boolean;
		private var _down:Boolean;
		
		private var _step:StepGame;
		private var _arrPath:Array = new Array(true,false);
		public function NPCEntity1(xPos:int,yPos:int,str:String="W") 
		{
			super(xPos, yPos);			
			graphic = new Image(Res.ENEMY_EVIL);
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			type = Opt.ENEMY_EVIL;	
			_path = str;
			_step = new StepGame();
			changePath();
		}
		
		private function changePath():void 
		{
			if (_left) 
			{
				_arrPath[0] = false;
				_arrPath[1] = true;
			}
			if (_right) 
			{
				_arrPath[0] = true;
				_arrPath[1] = false;
			}
			
			if (!_left && !_right) 
			{
				_arrPath[0] = false;
				_arrPath[1] = false;
			}
		}
		
		
		
		override public function update():void 
		{
			super.update();
			
			if (collide(Opt.WALL, x - 1, y) || collide(Opt.THORNS, x - 1, y) || collide(Opt.BOX, x - 1, y)) 
			{
				_left = false;
				changePath();
			}else{
				_left = true;
			}
			
			if (collide(Opt.WALL, x + 1, y) || collide(Opt.THORNS, x + 1, y) || collide(Opt.BOX, x + 1, y)) 
			{
				_right = false;
				changePath();
			}else{
				_right = true;
			}
			
			
			
			if (_step.moveP) 
			{
				if (_arrPath[0]){
					x += Opt.SPEED/2;
					//_mLeft = (collide(Opt.WALL, x - 1, y) || (_tgdL != null && !_tgdL.activeB) || (_boxL != null && !_boxL.moveLeftB))?false:true;					
				}				
				if (_arrPath[1]){
					x -= Opt.SPEED/2;
					//_mRight = (collide(Opt.WALL, x + 1, y) || (_tgdR != null && !_tgdR.activeB) || (_boxR != null && !_boxR.moveRightB))?false:true;					
				}				
							
			}
			
			
			//trace(_arrPath);
			
			if (_arrPath[0]) 
			{
				
			}if (_arrPath[1]) 
			{
				
			}
			
			if (_path=="W") 
			{
				
			}
		}
		
	}

}