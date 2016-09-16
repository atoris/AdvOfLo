package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import com.alsial.Res;
	import com.alsial.GameWorld;
	import com.alsial.Opt;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Teleport extends Entity
	{
		private var _tile:Tilemap;
		private var _grid:Grid;
		private var _isCollide:Boolean;
		private var _num:int = 0
		private var _xPos:int;
		private var _yPos:int;
		public function Teleport() 
		{
			var arrLevel:Array = GameWorld.ARR_LEVEL_ENTITY;
			_tile = new Tilemap(FP.getBitmap(Res.SET), arrLevel[0].length*Opt.SIZE_CAGE, arrLevel.length*Opt.SIZE_CAGE, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			_grid = new Grid(arrLevel[0].length*Opt.SIZE_CAGE, arrLevel.length*Opt.SIZE_CAGE, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			mask = _grid;
			graphic = _tile;
			//layer = 1;
			
			for (var i:int = 0; i < arrLevel.length;i++ ) 
			{
				for (var j:int = 0; j < arrLevel[i].length;j++) 
				{
					if (	arrLevel[i][j] == 79) 						
					{			
						
						_tile.setRect(j, i,1,1,arrLevel[i][j]);
						_grid.setRect(j, i, 1, 1, true);
					}					
				}
			}
			type = Opt.TELEPORT;
		}
		override public function update():void 
		{
			super.update();
			
			var collidePlayerSmall:Player = collide(Opt.PLAYER_SMALL, x, y) as Player;
			var collidePlayerBig:Player = collide(Opt.PLAYER, x, y) as Player;
			if ((collidePlayerSmall || collidePlayerBig) && _isCollide ) 
			{
				var pointPlayer1:Point = new Point(GameWorld.arrPlayer[1].x, GameWorld.arrPlayer[1].y);
				var pointPlayer0:Point = new Point(GameWorld.arrPlayer[0].x, GameWorld.arrPlayer[0].y);
				
				if (collidePlayerSmall && collidePlayerSmall.stepMove) 
				{
					GameWorld.arrPlayer[0].x = pointPlayer1.x;
					GameWorld.arrPlayer[0].y = pointPlayer1.y;
					GameWorld.arrPlayer[1].x = pointPlayer0.x;
					GameWorld.arrPlayer[1].y = pointPlayer0.y;
					
				}
				
				trace(collidePlayerSmall.stepMove);	
				
			}
			
			if (_num<32) 
			{
				_isCollide = false;
				_num++;
			}else{
				_num = 0;
				_isCollide = true;
			}
		}
		
	}

}