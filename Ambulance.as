package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Ambulance extends MovieClip
	{
		public function Ambulance()
		{
			addEventListener(Event.ENTER_FRAME,OnEnterFrame);
		}
		public function OnEnterFrame(event:Event):void
		{
			this.x -= 7;
			if(this.x<=-770)
			{
				this.x=1900;
			}
		}
	}
}