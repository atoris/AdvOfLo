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
	public class Floor extends Entity
	{
		private var _tile:Tilemap;
		private var _grid:Grid;
		
		public function Floor() 
		{
			var arrLevel:Array = GameWorld.ARR_LEVEL_WALL;
			_tile = new Tilemap(FP.getBitmap(Res.SET), arrLevel[0].length*Opt.SIZE_CAGE, arrLevel.length*Opt.SIZE_CAGE, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			_grid = new Grid(arrLevel[0].length*Opt.SIZE_CAGE, arrLevel.length*Opt.SIZE_CAGE, Opt.SIZE_CAGE, Opt.SIZE_CAGE);
			mask = _grid;
			graphic = _tile;
			//layer = 1;
			
			for (var i:int = 0; i < arrLevel.length;i++ ) 
			{
				for (var j:int = 0; j < arrLevel[i].length;j++) 
				{
					if (arrLevel[i][j]==5 || arrLevel[i][j]==6) 
					{					
						_tile.setRect(j, i,1,1,arrLevel[i][j]);
						_grid.setRect(j, i,1,1,true);
					
					}
				}
			}
			type = Opt.FLOOR;
		}
		
	}

}