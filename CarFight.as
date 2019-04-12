package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.display.Stage;
	import flash.media.Sound ;
	import flash.media.SoundChannel ;
	
	public class CarFight extends MovieClip
	{
		var objects:Array;
		var t:Timer;
		var mytime:uint;
		var myscore:uint;
		var diamondcount:uint;
		var startmsg:String;
		var s:Stage;
		var player:Player_Platform;
		var gameover:GameOver;
		var levelup:LevelUp;
		//Declaring variable for sound
		var s7:sound_level2;
		var soundch_level2:SoundChannel;
		var s8:sound_GameOver;
		var soundch_GameOver1:SoundChannel;
		var s9:sound_levelup;
		var soundch_levelup:SoundChannel;
		
		public function CarFight(stage:Stage)
		{
			player = new Player_Platform(stage);
			addChild(player);
			player.y=420;
			player.x=100;
			s=stage;
			//adding sound to level 2 page
			s7=new sound_level2;
			soundch_level2=new SoundChannel;
			soundch_level2=s7.play();// to play the music
			
			startmsg="Collect 10 Diamonds!!";
			output.text=startmsg;
			objects=new Array;
			mytime=0;
			myscore=0;
			score.text=""+myscore;
			addObjectToStage();
			addEventListener(Event.ENTER_FRAME,OnEnterFrame);
		}
		function addObjectToStage():void
		{
			trace("add");
			t=new Timer(3000,2);
			trace("timer created");
			t.addEventListener(TimerEvent.TIMER_COMPLETE,createYourObject);
			trace("timer event");
			t.start();
			trace("timer start");
		}
		function createYourObject(event:Event):void 
		{
			trace("create");
			var diamond:Diamond;
			diamond=new Diamond  ;
			diamond.x=Math.random()*1000;
			addChild(diamond);
			objects.push(diamond);
			addObjectToStage();
		}
		function OnEnterFrame(event:Event):void
		{
			// move the objects
			for (var i:int = objects.length - 1; i >= 0; i--) 
			{
				objects[i].y+=7;
				if (objects[i].y>=530)
				{
					removeChild(objects[i]);
					objects.splice(i,2);
				}
				//check if objects are caught
				else if (objects[i].hitTestObject(player)) 
				{
					myscore=myscore+50;;
					removeChild(objects[i]);
					objects.splice(i,2);
					score.text=""+myscore;
					diamondcount=diamondcount+1;
					checkRemaining();
					checkGameOver();
				}
			}
			if(player.hitTestObject(car2) ||player.hitTestObject(car3) || player.hitTestObject(car4) || player.hitTestObject(ambulance) )
			{
				player.meter.width-=1;
				trace(player.meter.width);
				checkGameOver();
			}
			/*if(player.hitTestObject(car3))
			{
				player.meter.width-=1;
				trace(player.meter.width);
				checkGameOver();
			}
			if(player.hitTestObject(car4))
			{
				player.meter.width-=1;
				trace(player.meter.width);
				checkGameOver();
			}
			if(player.hitTestObject(ambulance))
			{
				player.meter.width-=1;
				trace(player.meter.width);
				checkGameOver();
			} */
		}
		function checkGameOver():void
		 {
			if(diamondcount == 10)
			{
				removeEventListener(Event.ENTER_FRAME,OnEnterFrame);
				t.removeEventListener(TimerEvent.TIMER_COMPLETE,createYourObject);
				soundch_level2.stop();//to stop the music
				
				s9=new sound_levelup;
				soundch_levelup=new SoundChannel;
				soundch_levelup=s9.play();// to play the music
				
				levelup = new LevelUp;
				addChild(levelup);
				levelup.score.text=myscore+"";
				levelup.btnlevelup.addEventListener(MouseEvent.CLICK,NextLevel);
				
			}
			if(player.meter.width == 0 )
			{
				removeEventListener(Event.ENTER_FRAME,OnEnterFrame);
				t.removeEventListener(TimerEvent.TIMER_COMPLETE,createYourObject);
				soundch_level2.stop();//to stop the music
				
				s8=new sound_GameOver;
				soundch_GameOver1=new SoundChannel;
				soundch_GameOver1=s8.play();// to play the music
				
				gameover = new GameOver;
				addChild(gameover);
				gameover.score.text=myscore+"";
				gameover.btnagain.addEventListener(MouseEvent.CLICK,OnAgainClick);
			}
		}
		public function NextLevel(event:MouseEvent):void
		{
			soundch_levelup.stop();//to stop the music
			var level3:Level3;
			level3 = new Level3(s);
			addChild(level3);
			//stage.focus=level3;
		}
		public function OnAgainClick(event:MouseEvent):void
		{
			soundch_GameOver1.stop();//to stop the music
			var carFight:CarFight;
			removeChild(gameover);
			carFight = new CarFight(s);
			addChild(carFight);
			//stage.focus=carFight;
		}
		function checkRemaining():void
		{
			trace("checkremain");
			if(diamondcount == 1)
			{
				trace("1");
				startmsg="Still 9 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 2)
			{
				trace("2");
				startmsg="Still 8 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 3)
			{
				trace("3");
				startmsg="Still 7 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 4)
			{
				trace("4");
				startmsg="Still 6 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 5)
			{
				trace("5");
				startmsg="Still 5 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 6)
			{
				trace("5");
				startmsg="Still 4 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 7)
			{
				trace("5");
				startmsg="Still 3 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 8)
			{
				trace("5");
				startmsg="Still 2 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 9)
			{
				trace("5");
				startmsg="Still 1 Left!!";
				output.text=startmsg;
			}
			else if(diamondcount == 10)
			{
				startmsg="Superrrr!!!!";
				output.text=startmsg;
				checkGameOver();
			}
		}
	}
}