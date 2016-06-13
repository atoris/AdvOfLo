package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import com.alsial.Res;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import com.alsial.StepGame;
	import com.alsial.Opt;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Player extends Entity 
	{
		private var _mLeft:Boolean;
		private var _mRight:Boolean;
		private var _mDown:Boolean;
		private var _mUp:Boolean;
		//private const Opt.SPEED:int = 4;
		
		private var _kLeft:Boolean;
		private var _kRight:Boolean;
		private var _kDown:Boolean;
		private var _kUp:Boolean;
		
		private var _boxL:Box;
		private var _boxR:Box;
		private var _boxU:Box;
		private var _boxD:Box;
		
		private var _tgdL:TriggerDoor;
		private var _tgdR:TriggerDoor;
		private var _tgdD:TriggerDoor;
		private var _tgdU:TriggerDoor;
		
		
		private var _step:StepGame;
		
		
		
		public function Player(x:Number=0, y:Number=0) 
		{
			super(x, y);			
			graphic = new Image(Res.PLAYER);
			setHitbox(32, 32);
			type = Opt.PLAYER;		
			_step = new StepGame(32,4);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Down", Key.S, Key.DOWN);
			Input.define("Up", Key.W, Key.UP);			
		}
		
		override public function update():void 
		{
			super.update();	
			inputCheck();
			stepMoveP();
			move();
		}
		
		
		private function stepMoveP():void 
		{
			
			_boxL = collide(Opt.BOX, x - 1, y) as Box;
			_boxR = collide(Opt.BOX, x + 1, y) as Box;
			_boxU = collide(Opt.BOX, x, y - 1) as Box;
			_boxD = collide(Opt.BOX, x, y + 1) as Box;	
			
			_tgdL = collide(Opt.TRIGGERDOOR, x - 1, y) as TriggerDoor;
			_tgdR = collide(Opt.TRIGGERDOOR, x + 1, y) as TriggerDoor;
			_tgdU = collide(Opt.TRIGGERDOOR, x, y - 1) as TriggerDoor;
			_tgdD = collide(Opt.TRIGGERDOOR, x, y + 1) as TriggerDoor;	
			
			
			//trace(_tgdL,_tgdR,_tgdU,_tgdD);
			
			var star:Star = collide(Opt.STAR, x, y) as Star;
			if (star) 
			{
				star.destroy();
			}
			var thr:Thorns = collide(Opt.THORNS, x, y) as Thorns;
			if (thr) 
			{
				thr.reActive();
				if (thr.boolDead) 
				{
					FP.world.remove(this);
				}
			}
			
			if (_step.moveP) 
			{
				if (_kLeft){
					_mLeft = (collide(Opt.WALL, x - 1, y) || (_tgdL != null && _tgdL.activeB) || (_boxL != null && !_boxL.moveLeftB))?false:true;					
				}				
				if (_kRight){
					_mRight = (collide(Opt.WALL, x + 1, y) || (_tgdR != null && _tgdR.activeB) || (_boxR != null && !_boxR.moveRightB))?false:true;					
				}				
				if (_kDown){
					_mDown = (collide(Opt.WALL, x, y + 1) || (_tgdD != null && _tgdD.activeB) || (_boxD != null && !_boxD.moveDownB))?false:true;										
				}
				if (_kUp){
					_mUp = (collide(Opt.WALL, x, y - 1) || (_tgdU != null && _tgdU.activeB) || (_boxU != null && !_boxU.moveUpB))?false:true;						
				}				
			}
		}
		
		
		private function move():void 
		{
			if (_mLeft) 
			{
				if (_step.move()) 
				{						
					if (_boxL) 
					{						
						_boxL.moveLeft();
					}
					x -= Opt.SPEED;
				}else {					
					_mLeft = false;
					_step.reMove();					
				}
			}
			if (_mRight) 
			{
				if (_step.move()) 
				{
						
					if (_boxR) 
					{						
						_boxR.moveRight();
					}
					x += Opt.SPEED;
				}
				else {						
					_mRight = false;
					_step.reMove();					
				}
			}
			if (_mDown) 
			{
				if (_step.move() ) 
				{
					if (_boxD) 
					{						
						_boxD.moveDown();
					}
					y += Opt.SPEED;
				}else {						
					_mDown = false;
					_step.reMove();					
				}
			}
			if (_mUp ) 
			{
				if (_step.move()  ) 
				{
					
					if (_boxU) 
					{						
						_boxU.moveUp();
					}
					y -= Opt.SPEED;
				}else {						
					_mUp = false;
					_step.reMove();					
				}
			}
		}
		
		private function inputCheck():void 
		{
			if (Input.check("Left")) 
			{
				_kLeft = true;
				_kRight = false;
				_kDown = false;
				_kUp = false;
			}else {
				_kLeft = false;
			}
			if (Input.check("Right")) 
			{
				_kRight = true;
				_kLeft = false;
				_kDown = false;
				_kUp = false;
			}else {
				_kRight = false;
			}
			if (Input.check("Down")) 
			{
				_kDown = true;
				_kRight = false;
				_kLeft = false;
				_kUp = false;
			}else {
				_kDown = false;
			}
			if (Input.check("Up")) 
			{
				_kUp = true;
				_kRight = false;
				_kDown = false;
				_kLeft = false;
			}else {
				_kUp = false;
			}
		}
	}

}