package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Car2 extends MovieClip
	{
		public function Car2()
		{
			addEventListener(Event.ENTER_FRAME,OnEnterFrame);
		}
		public function OnEnterFrame(event:Event):void
		{
			this.x -= 5;
			if(this.x<-100)
			{
				this.x=1100;
			}
		}
	}
}