package
{
	import com.alsial.GameWorld;
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Main extends Engine 
	{
		//test
		public function Main() 
		{
			super(640, 480, 60);
			FP.world = new GameWorld();
		}
		override public function init():void 
		{
			super.init();
		}
		
		
		
	}
	
}