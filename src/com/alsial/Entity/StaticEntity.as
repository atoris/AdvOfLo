package com.alsial.Entity 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import com.alsial.StepGame;
	import com.alsial.Opt;
	import com.alsial.GameWorld;
	import com.alsial.CollideEntity;
	/**
	 * ...
	 * @author Atoris
	 */
	public class StaticEntity extends Entity
	{
		protected var _step:StepGame;
		
		protected var _push:Boolean;
		protected var _moveLeftB:Boolean;
		protected var _moveRightB:Boolean;
		protected var _moveUpB:Boolean;
		protected var _moveDownB:Boolean;
		
		private var _tgdL:TriggerDoor;
		private var _tgdR:TriggerDoor;
		private var _tgdD:TriggerDoor;
		private var _tgdU:TriggerDoor;
		
		private var _collide:CollideEntity;
		private var _activeB:Boolean;
		private var _activeB2:Boolean;
		protected var _img:Image;
		public function StaticEntity(xPos:Number=0,yPos:Number=0) 
		{
			_collide = new CollideEntity(this,[Opt.WALL,Opt.BOX,Opt.PLAYER_SMALL,Opt.TRIGGERDOOR,Opt.TRIGGERBUTTON,Opt.EL_DOWN,Opt.EL_LEFT,Opt.EL_RIGHT,Opt.EL_UP]);
			
		}
		
		
		override public function update():void 
		{
			super.update();
			//var tgdL:TriggerDoor = collide(Opt.TRIGGERDOOR, x - 1, y) as TriggerDoor;
			//var tgdR:TriggerDoor = collide(Opt.TRIGGERDOOR, x + 1, y) as TriggerDoor;
			//var tgdD:TriggerDoor = collide(Opt.TRIGGERDOOR, x, y + 1) as TriggerDoor;
			//var tgdU:TriggerDoor = collide(Opt.TRIGGERDOOR, x, y - 1) as TriggerDoor;
			
			
			var thr:Thorns = collide(Opt.THORNS, x, y) as Thorns;
			if (thr) 
			{
				thr.reActive();
				if (thr.boolDead) 
				{
					FP.world.remove(this);
				}
			}
			
			//trace(tgdL,tgdR,tgdU,tgdD);
			
			_moveLeftB =	!_collide.getLeft()	//	&&!(tgdL !=null && tgdL.activeB);// && !collide(Opt.PLAYER_SMALL,x-Opt.SIZE_CAGE/2+1,y);
			_moveRightB =	!_collide.getRight()//	&&!(tgdR != null && tgdR.activeB)//	&& !collide(Opt.PLAYER_SMALL,x+Opt.SIZE_CAGE/2+1,y);
			_moveDownB =	!_collide.getDown()//	&&!(tgdD != null && tgdD.activeB)//	&& !collide(Opt.PLAYER_SMALL,x,y+Opt.SIZE_CAGE/2+1);
			_moveUpB =	!_collide.getUp()//		&&!(tgdU != null && tgdU.activeB)//	&& !collide(Opt.PLAYER_SMALL,x,y-Opt.SIZE_CAGE/2+1);
			
			
			if (collide(Opt.POINT_BOX,x,y))
			{
				if (!_activeB) 
				{
					Opt.numStar--;
					
					_activeB = true;
					_activeB2 = true;
					_img.color = 0x00FF00;
					//_img.alpha = .5;
					//trace(Opt.numStar);
				}
			}else{
				if (_activeB2) 
				{
					_activeB2 = false;
					_img.color = 0xFFFFFF;
					_img.alpha = 1;
					Opt.numStar++;
					//trace(Opt.numStar);
				}
				_activeB = false;
			}
			
			//trace(_collide.getLeft(),_collide.type);
		}
		public function moveLeft():void {
			if (_moveLeftB)
			{
				x -= Opt.SPEED;
				_push = true;
			}else {
				
				_push = false;
			}
			
		}
		public function moveRight():void 
		{
			
			if (_moveRightB) 
			{
				x += Opt.SPEED;
				_push = true;
			}else {				
				_push = false;
				
			}
			
			
		}
		
		public function moveDown():void 
		{
			if (_moveDownB) 
			{
				y += Opt.SPEED;
				_push = true;
			}else {				
				_push = false;
				
			}
			
		}
		public function moveUp():void 
		{
			if (_moveUpB) 
			{
				y -= Opt.SPEED;
				_push = true;
			}else {				
				_push = false;				
			}
		}
		
		
		
		public function destroy():void {
			
			FP.world.remove(this);	
		}
		
		public function get moveLeftB():Boolean 
		{
			return _moveLeftB;
		}
		
		public function set moveLeftB(value:Boolean):void 
		{
			_moveLeftB = value;
		}
		
		public function get moveRightB():Boolean 
		{
			return _moveRightB;
		}
		
		public function set moveRightB(value:Boolean):void 
		{
			_moveRightB = value;
		}
		
		public function get moveUpB():Boolean 
		{
			return _moveUpB;
		}
		
		public function set moveUpB(value:Boolean):void 
		{
			_moveUpB = value;
		}
		
		public function get moveDownB():Boolean 
		{
			return _moveDownB;
		}
		
		public function set moveDownB(value:Boolean):void 
		{
			_moveDownB = value;
		}
		
	}

}