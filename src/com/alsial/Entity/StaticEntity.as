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
		
		public function StaticEntity(xPos:Number=0,yPos:Number=0) 
		{
			//_pos = new Point(int(y/32),int(x/32));
		}
		
		
		override public function update():void 
		{
			super.update();
			
			_moveLeftB = !collide(Opt.WALL, x - 1, y);
			_moveRightB = !collide(Opt.WALL, x + 1, y);
			_moveDownB = !collide(Opt.WALL, x, y + 1);
			_moveUpB = !collide(Opt.WALL, x, y - 1);
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