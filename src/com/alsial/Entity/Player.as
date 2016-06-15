package com.alsial.Entity 
{
	import com.alsial.CollideEntity;
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
		
		private var _collide:CollideEntity;
		
		private var _tgdL:TriggerDoor;
		private var _tgdR:TriggerDoor;
		private var _tgdD:TriggerDoor;
		private var _tgdU:TriggerDoor;
		
		
		private var _step:StepGame;
		private var _stepMove:Boolean;
		private var _playerB:Boolean=true;
		
		public function Player(xPos:Number = 0, yPos:Number = 0, t:String = Opt.PLAYER) 
		{
			super(xPos,yPos);
			this.type = t;	
			_collide = new CollideEntity(this,[Opt.WALL,Opt.BOX,Opt.STAR,Opt.THORNS,Opt.TRIGGERBUTTON,Opt.TRIGGERDOOR]);			
			if (type==Opt.PLAYER_SMALL) 
			{
				graphic = new Image(Res.ENEMY_EVIL);
				
				_playerB = false;	
				
				
			}else{
				graphic = new Image(Res.PLAYER);
				
				_playerB = true;
				
			}
			setHitbox(Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			_step = new StepGame(Opt.SIZE_CAGE,4);
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
		
		public function resize():void{
			
			
		}
		
		private function stepMoveP():void 
		{
			_step.dist = Opt.SIZE_CAGE;
			_boxL = collide(Opt.BOX, x - 1, y) as Box;
			_boxR = collide(Opt.BOX, x + 1, y) as Box;
			_boxU = collide(Opt.BOX, x, y - 1) as Box;
			_boxD = collide(Opt.BOX, x, y + 1) as Box;	
			
			_tgdL = collide(Opt.TRIGGERDOOR, x - 1, y) as TriggerDoor;
			_tgdR = collide(Opt.TRIGGERDOOR, x + 1, y) as TriggerDoor;
			_tgdU = collide(Opt.TRIGGERDOOR, x, y - 1) as TriggerDoor;
			_tgdD = collide(Opt.TRIGGERDOOR, x, y + 1) as TriggerDoor;	
			
			//var elvR:Elevator = collide(Opt.EL_RIGHT, x, y) as Elevator;
			if (collide(Opt.EL_RIGHT, x, y)||collide(Opt.EL_LEFT, x, y)||collide(Opt.EL_DOWN, x, y)||collide(Opt.EL_UP, x, y)) 
			{
				_step.dist = 99999;				
			}
			
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
			
			
			if (collide(Opt.TRIGGERDOOR,x,y)) 
			{
				_step.dist = Opt.SIZE_CAGE * 2;	
				
			}
			
			
			if (_step.moveP) 
			{
				if (_kLeft){		
					if (type!=Opt.PLAYER_SMALL) 
					{
						_mLeft = (	collide(Opt.WALL, x - 1, y) ||
									collide(Opt.EL_RIGHT, x - 1, y) || 
									collide(Opt.EL_DOWN, x - 1, y) ||
									collide(Opt.EL_UP, x - 1, y) ||
									(_tgdL != null && _tgdL.activeB) || 
									(_boxL != null && !_boxL.moveLeftB)
								)?false:true;					
					}else{
						_mLeft = (	collide(Opt.WALL, x - 1, y) ||
									collide(Opt.EL_RIGHT, x - 1, y) || 
									collide(Opt.EL_DOWN, x - 1, y) ||
									collide(Opt.EL_UP, x - 1, y) ||
									(_tgdL != null && _tgdL.activeB) || 
									collide(Opt.BOX, x - 1, y)
								) ?false:true;					
					}
					
				}						
				if (_kRight){
					if (type!=Opt.PLAYER_SMALL) 
					{					
						_mRight = (	collide(Opt.WALL, x + 1, y) ||
									collide(Opt.EL_LEFT, x + 1, y) || 
									collide(Opt.EL_DOWN, x+1, y) ||
									collide(Opt.EL_UP, x+1, y) ||
									(_tgdR != null && _tgdR.activeB) ||
									(_boxR != null && !_boxR.moveRightB)
								)?false:true;					
					}else{
						_mRight = (	collide(Opt.WALL, x + 1, y) ||
									collide(Opt.EL_LEFT, x + 1, y) || 
									collide(Opt.EL_DOWN, x+1, y) ||
									collide(Opt.EL_UP, x+1, y) ||
									(_tgdR != null && _tgdR.activeB) || 
									collide(Opt.BOX, x + 1, y)
								)?false:true;					
					}
				}
				if (_kDown){
					if (type!=Opt.PLAYER_SMALL) 
					{
						_mDown = (	collide(Opt.WALL, x, y + 1) ||
									collide(Opt.EL_LEFT, x, y+1) || 
									collide(Opt.EL_RIGHT, x, y+1) ||
									collide(Opt.EL_UP, x, y+1) ||
									(_tgdD != null && _tgdD.activeB) ||
									(_boxD != null && !_boxD.moveDownB)
								)?false:true;	
					}else{
						_mDown = (	collide(Opt.WALL, x, y + 1) ||
									collide(Opt.EL_LEFT, x, y+1) || 
									collide(Opt.EL_RIGHT, x, y+1) ||
									collide(Opt.EL_UP, x, y+1) ||
									(_tgdD != null && _tgdD.activeB) || 
									collide(Opt.BOX, x, y + 1)
								)?false:true;	
					}
				}	
				if (_kUp){
					if (type!=Opt.PLAYER_SMALL) 
					{
						_mUp = 	(	collide(Opt.WALL, x, y - 1) ||
									collide(Opt.EL_LEFT, x, y-1) || 
									collide(Opt.EL_RIGHT, x, y-1) ||
									collide(Opt.EL_DOWN, x, y-1) ||
									(_tgdU != null && _tgdU.activeB) || 
									(_boxU != null && !_boxU.moveUpB)
								)?false:true;		
					}else{
						_mUp = 	(	collide(Opt.WALL, x, y - 1) ||
									collide(Opt.EL_LEFT, x, y-1) || 
									collide(Opt.EL_RIGHT, x, y-1) ||
									collide(Opt.EL_DOWN, x, y-1) ||
									(_tgdU != null && _tgdU.activeB)  || 
									collide(Opt.BOX, x, y - 1)
								)?false:true;		
					}					
				}				
			}
		}
		
		
		
		private function move():void 
		{
			
			//trace("STEP: ",_step.move());
			if (_playerB) 
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
		
		public function get playerB():Boolean 
		{
			return _playerB;
		}
		
		public function set playerB(value:Boolean):void 
		{
			_playerB = value;
		}
		
		public function get mLeft():Boolean 
		{
			return _mLeft;
		}
		
		public function set mLeft(value:Boolean):void 
		{
			_mLeft = value;
		}
		
		public function get mRight():Boolean 
		{
			return _mRight;
		}
		
		public function set mRight(value:Boolean):void 
		{
			_mRight = value;
		}
		
		public function get mDown():Boolean 
		{
			return _mDown;
		}
		
		public function set mDown(value:Boolean):void 
		{
			_mDown = value;
		}
		
		public function get mUp():Boolean 
		{
			return _mUp;
		}
		
		public function set mUp(value:Boolean):void 
		{
			_mUp = value;
		}
	}

}