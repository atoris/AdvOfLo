package com.alsial 
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Atoris
	 */
	public class GameOver extends World
	{
		
		public function GameOver() 
		{
			var _text:Text = new Text("PRESS SPACE TO NEXT LEVEL");
			_text.x = Opt.SW / 2 - _text.width / 2;
			_text.y = Opt.SH / 2-_text.height/2;
			
			addGraphic(_text);
		}
		override public function update():void 
		{
			super.update();
			if (Input.pressed(Key.SPACE)) 
			{
				FP.world.removeAll();
				FP.world = new ChangeLevelMenu();
			}
		}
		
	}

}