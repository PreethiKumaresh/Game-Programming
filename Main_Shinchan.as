package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	
	public class Main_Shinchan extends MovieClip
	{
		var gamestart:GameStart;
		
		public function Main_Shinchan()
		{
			init();
		}
		public function init():void
		{
			gamestart = new GameStart(stage);
			addChild(gamestart);
		}
		
	}
}