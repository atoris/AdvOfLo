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
	public class MenuWorld extends World
	{
		private var _arrMenuItem:Array;
		private var _arrMenuGraphic:Array;
		private var _text:Text;
		private var _numMenuItem:int;
		
		private var _titleGameHeader:Text;
		private var _titleGameFooter:Text;
		
		//private var _scrollOpt:ScrollOptions;
		
		
		public function MenuWorld() 
		{
			super();
			_arrMenuItem = ["NEW GAME", "CONTINUE", "OPTIONS", "EXIT"];
			_arrMenuGraphic = new Array();
			for (var i:int = 0; i < _arrMenuItem.length; i++) 
			{
				_text = new Text(_arrMenuItem[i]);
				_text.x = Opt.SW / 2 - _text.width / 2;
				_text.y = Opt.SH / 2+i*_text.height-(_text.height*2);
			
				_arrMenuGraphic[i] = _text;
				
				addGraphic(_text);
			}
				_arrMenuGraphic[0].color = 0xFFFF00;
			//_text.
			
			Input.define("Down", Key.S, Key.DOWN);
			Input.define("Up", Key.W, Key.UP);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Rigth", Key.D, Key.RIGHT);
			
			Input.define("Start", Key.SPACE, Key.ENTER);
			
			//_scrollOpt = new ScrollOptions();
			//add(_scrollOpt);
			
		}
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed("Down")) 
			{
				if (_numMenuItem<3) 
				{
					_numMenuItem++;
				}else {
					_numMenuItem=0;
				}
			}
			if (Input.pressed("Up")) 
			{
				if (_numMenuItem>0) 
				{
					_numMenuItem--;
				}else {
					_numMenuItem=3;
				}
			}
			for (var i:int = 0; i < _arrMenuGraphic.length; i++) 
			{
				_arrMenuGraphic[i].color = 0xFFFFFF;
			}
			
			if (_numMenuItem==2) 
			{
				if (Input.check("Left")) 
				{
					//_scrollOpt.minus();
				}
				if (Input.check("Rigth")) 
				{
					//_scrollOpt.plus();
				}
			
			}
			if (_numMenuItem==0 && Input.pressed("Start")) 
			{
				FP.world.removeAll();
				Opt.numLevel = 0;
				//FP.world = new MyWorld();
				FP.world = new GameWorld();
			}
			if (_numMenuItem==1 && Input.pressed("Start")) 
			{
				FP.world.removeAll();
				Opt.numLevel == _numMenuItem;
				//FP.world = new MyWorld();
				FP.world = new ChangeLevelMenu();
			}
			_arrMenuGraphic[_numMenuItem].color = 0xFFFF00;
		}		
		
	}

}