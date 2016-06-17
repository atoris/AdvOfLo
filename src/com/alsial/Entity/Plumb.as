package com.alsial.Entity 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Entity;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import com.alsial.Res;
	import com.alsial.GameWorld;
	import com.alsial.Opt;
	/**
	 * ...
	 * @author Atoris
	 */
	public class Plumb extends Entity
	{
		private var _tile:Tilemap;
		private var _grid:Grid;
		
		public function Plumb() 
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
					if (	arrLevel[i][j] == 42 || arrLevel[i][j] == 43 || arrLevel[i][j] == 44 || 
						arrLevel[i][j] == 45 || arrLevel[i][j] == 46 || arrLevel[i][j] == 47 || 
						arrLevel[i][j] == 48 || arrLevel[i][j] == 49 || arrLevel[i][j] == 50 ||
						arrLevel[i][j] == 51 || arrLevel[i][j] == 52 || arrLevel[i][j] == 53 ||
						arrLevel[i][j] == 54 || arrLevel[i][j] == 55) 						
					{					
						_tile.setRect(j, i,1,1,arrLevel[i][j]);
						_grid.setRect(j, i, 1, 1, true);
						
					
					}
					
					
				}
			}
			type = Opt.PLUMB;
		}
		
	}

}