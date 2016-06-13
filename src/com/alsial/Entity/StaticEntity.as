package com.alsial.Entity 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import com.alsial.StepGame;
	import com.alsial.Opt;
	import com.alsial.GameWorld;
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
		public function StaticEntity(xPos:Number=0,yPos:Number=0) 
		{
			//_pos = new Point(int(y/32),int(x/32));
		}
		
		
		override public function update():void 
		{
			super.update();
			
			
			_tgdL = collide(Opt.TRIGGERDOOR, x - 1, y) as TriggerDoor;
			_tgdR = collide(Opt.TRIGGERDOOR, x + 1, y) as TriggerDoor;
			_tgdU = collide(Opt.TRIGGERDOOR, x, y - 1) as TriggerDoor;
			_tgdD = collide(Opt.TRIGGERDOOR, x, y + 1) as TriggerDoor;	
			
			
			var ml:Boolean = (_tgdL != null)// && _tgdL.activeB;
			var mr:Boolean = (_tgdR != null)// && _tgdR.activeB;
			var md:Boolean = (_tgdD != null)// && _tgdD.activeB;
			var mu:Boolean = (_tgdU != null)// && _tgdU.activeB;
			
			
			_moveLeftB = (!collide(Opt.WALL, x - 1, y) && !ml);
			_moveRightB = (!collide(Opt.WALL, x + 1, y) && !mr);
			_moveDownB = (!collide(Opt.WALL, x, y + 1) && !md);
			_moveUpB = (!collide(Opt.WALL, x, y - 1) && !mu);
			
			trace(_moveLeftB,_moveRightB,_moveDownB,_moveUpB);
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