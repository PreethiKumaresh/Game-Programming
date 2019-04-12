package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import flash.display.Stage;
	import flash.media.Sound ;
	import flash.media.SoundChannel ;
	
	public class GameStart extends MovieClip
	{
		var s:Stage;
		var help:Help;
		var story:Story;
		var findKey:FindKey;
		//declaring sound variables
		var s1:sound_GameStart;
		var s2:sound_Help;
		var s3:sound_Story;
		var soundch_GameStart:SoundChannel;
		var soundch_Help:SoundChannel;
		var soundch_Story:SoundChannel;
		
		public function GameStart(stage:Stage)
		{
			s=stage;
			//adding sound to GameStart Page
			s1=new sound_GameStart;
		    soundch_GameStart=new SoundChannel;
			soundch_GameStart=s1.play();
			btnplay.addEventListener(MouseEvent.CLICK,OnPlayClick);
			btnhelp.addEventListener(MouseEvent.CLICK,OnHelpClick);
		}
		
		public function OnPlayClick(event:MouseEvent):void
		{
			soundch_GameStart.stop();
			findKey = new FindKey(s);
			addChild(findKey);
		}
		public function OnHelpClick(event:MouseEvent):void
		{
			soundch_GameStart.stop();
			help = new Help;
			addChild(help);
			//adding sound to Help Page
			s2=new sound_Help;
			soundch_Help= new SoundChannel;
			soundch_Help=s2.play();
			help.btnready.addEventListener(MouseEvent.CLICK,OnReadyClick);
		}
		public function OnReadyClick(event:MouseEvent):void
		{
			soundch_Help.stop();
			story = new Story;
			removeChild(help);
			addChild(story);
			//adding sound to Story Page
			s3=new sound_Story;
		    soundch_Story=new SoundChannel;
			soundch_Story=s3.play();
			story.btnyes.addEventListener(MouseEvent.CLICK,OnYesClick);
			story.btnno.addEventListener(MouseEvent.CLICK,OnNoClick);
		}
		public function OnYesClick(event:MouseEvent):void
		{
			soundch_Story.stop();
			findKey = new FindKey(s);
			addChild(findKey);
		}
		public function OnNoClick(event:MouseEvent):void
		{
			soundch_Story.stop();
			removeChild(story);
			soundch_GameStart=s1.play();
		}
	}
}