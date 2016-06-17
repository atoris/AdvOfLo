package
{
	import com.alsial.GameWorld;
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import com.alsial.MenuWorld;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Main extends Engine 
	{
	
	//ccc
		public function Main() 
		{
			super(640, 480, 60);
			FP.world = new MenuWorld();
			//FP.world = new GameWorld();
		}
		override public function init():void 
		{
			super.init();
		}
		
		
		
	}
	
}