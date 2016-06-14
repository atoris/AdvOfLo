package com.alsial  
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class StepGame 
	{
		private var _dist:int = Opt.SIZE_CAGE;
		private var _minDist:int = 0;
		private var _step:int = 4;
		private var _moveP:Boolean=true;
		public function StepGame(dist:int=Opt.SIZE_CAGE,step:int=4) 
		{
			_dist = dist;
			_step = step;
		}
		
		public function move():Boolean 
		{
			if (_minDist < _dist) 
			{
				_minDist += _step;
				_moveP = false;
				return true;
			}
			
			return false;
		}
		public function reMove():void 
		{
			_moveP = true;
			_minDist = 0;
		}
		
		public function get dist():int 
		{
			return _dist;
		}
		
		public function set dist(value:int):void 
		{
			_dist = value;
		}
		
		public function get step():int 
		{
			return _step;
		}
		
		public function set step(value:int):void 
		{
			_step = value;
		}
		
		public function get moveP():Boolean 
		{
			return _moveP;
		}
		
		public function set moveP(value:Boolean):void 
		{
			_moveP = value;
		}
		
	}

}