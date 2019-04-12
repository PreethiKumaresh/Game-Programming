package
{
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class BG extends MovieClip
	{
	    public function BG()
		{
		addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		function onEnterFrame(event:Event):void
		{
			this.x -= 3;
			if(this.x < -1000)
			{
				this.x=0;
			}
		}
	}
}