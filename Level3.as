package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Stage;
	import flash.media.Sound ;
    import flash.media.SoundChannel ;

	public class Level3 extends MovieClip
	{
		private var _collectionJar:Array;
		var s:Stage;
		var player:Player_Platform;
		var myscore:uint;
		var gamewon:GameWin;
		var t1:Timer;
		var timer:int;
		var gameover:GameOver;
		//creating sound variable
		var s10:sound_level3;
		var soundch_level3:SoundChannel;
		var s11:sound_GameWon;
		var soundch_GameWon:SoundChannel;
		var s12:sound_GameOver;
		var soundch_GameOver2:SoundChannel;

		public function Level3(stage:Stage)
		{
			player=new Player_Platform(stage);
			addChild(player);
			player.y=420;
			player.x=100;
			s=stage;
			myscore=0;
			score.text=myscore+"";
			s10=new sound_level3;
			soundch_level3=new SoundChannel;
			soundch_level3=s10.play();// to play the music
			
			//Creating Time
			t1=new Timer(1000);
			timer=120;
			time.text=timer+"";
			t1.start();
			t1.addEventListener(TimerEvent.TIMER,onCountDown);
			//addCoinToStage();
			//Initialize objects for Key1
			mykey1.vx=0;
			mykey1.vy=0;
			mykey1.addEventListener(Event.ENTER_FRAME, onKeyMove);
			mykey1.addEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);

			//Initialize objects for Key2
			mykey2.vx=0;
			mykey2.vy=0;
			mykey2.addEventListener(Event.ENTER_FRAME, onKeyMove);
			mykey2.addEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);

			//Initialize objects for Key3
			mykey3.vx=0;
			mykey3.vy=0;
			mykey3.addEventListener(Event.ENTER_FRAME, onKeyMove);
			mykey3.addEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);

			addEventListener(Event.ENTER_FRAME, onEnterFrame);

			//Initialize array and variables
			_collectionJar = new Array();
			_collectionJar=[];

			for (var i:int = 0; i < numChildren; i++)
			{
				trace(i + ". " + getChildAt(i).name);
			}
		}
		public function onCountDown(event:TimerEvent):void 
		{
			timer--;
			time.text=timer+"";
			if (timer==0) 
			{
				t1.stop();
				timer=0;
				trace("game over due to time");
				gameover_level3();
			}
		}
		private function onKeyMove(event:Event):void 
		{
			//Create a variable to store a reference to the bug object
			var bug:MovieClip=event.target as MovieClip;

			//Add Brownian motion to the velocities
			bug.vx += (Math.random() * 0.2 - 0.1) * 15;
			bug.vy += (Math.random() * 0.2 - 0.1) * 15;

			//Add some friction
			bug.vx*=0.95;
			bug.vy*=0.95;

			//Move the bug
			bug.x+=bug.vx;
			bug.y+=bug.vy;

			//Stage Boundaries
			if (bug.x>stage.stageWidth) 
			{
				bug.x=stage.stageWidth;
				//Reverse (bounce) bug's velocity when it hits the stage edges
				bug.vx*=-1;
			}
			if (bug.x<0) 
			{
				bug.x=0;
				bug.vx*=-1;
			}

			//Keep the bug above the water
			if (bug.y>stage.stageHeight-35)
			{
				bug.y=stage.stageHeight-35;
				bug.vy*=-1;
			}
			if (bug.y<0)
			{
				bug.y=0;
				bug.vy*=-1;
			}

			//Apply collision with platform
			for (var i:int = 0; i <= 30; i++)
			{
				Collision.playerAndPlatform(bug, this["platform" + i],0,0);
			}
			//Player Friction With Key
			if ((Math.abs(bug.x - player.x) < 60)   ) 
			{
				if (Math.abs(bug.y-player.y)<60) 
				{
					//If the player is moving...
					bug.vy += player.vy + ((Math.random() * 0.2 - 0.1) * 30);
					bug.vx += player.vx + ((Math.random() * 0.2 - 0.1) * 30);
					//trace(bug.name + ": Cat!");
					if ((Math.abs(player.vy) < 1) && (Math.abs(player.vx) <1 )) {
						//If the player is sitting still...
						bug.y+=- bug.vy;
						bug.x+=- bug.vx;
						bug.vy*=-1;
						bug.vx*=-1;
					}
				}
			}
		}
		private function onCollisionWithPlayer(event:Event):void 
		{
			var collectionItem:MovieClip=event.target as MovieClip;
			if (_collectionJar.length < 3)
			{
				if (player.hitTestPoint(collectionItem.x,collectionItem.y,true))
				{
					myscore=myscore+100;
					score.text=myscore+"";
					this["itemBox"+_collectionJar.length].addChild(collectionItem);
					collectionItem.x=0;
					collectionItem.y=0;
					_collectionJar.push(collectionItem);
					//Remove listeners of collected items
					if (_collectionJar.length== 3) 
					{
						trace("GameWon");
						soundch_level3.stop();//to stop the music
						removeEvent();
					
						gamewon=new GameWin  ;
						addChild(gamewon);
						//adding sound to game won page
						s11=new sound_GameWon;
						soundch_GameWon=new SoundChannel;
						soundch_GameWon=s11.play();// to play the music
						
						gamewon.score.text=myscore+"";
						gamewon.btnrestart.addEventListener(MouseEvent.CLICK,OnRestartClick);

					}
					collectionItem.removeEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);
					collectionItem.removeEventListener(Event.ENTER_FRAME, onKeyMove);
					trace("Bugs Collected: " + _collectionJar);
				}
			}
		}
		public function OnRestartClick(event:MouseEvent):void 
		{
			soundch_GameWon.stop();//to stop the music
			var gamestart1:GameStart;
			gamestart1=new GameStart(s);
			addChild(gamestart1);
		}
		public function removeEvent():void 
		{
			mykey1.removeEventListener(Event.ENTER_FRAME, onKeyMove);
			mykey1.removeEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);
			mykey2.removeEventListener(Event.ENTER_FRAME, onKeyMove);
			mykey2.removeEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);
			mykey3.removeEventListener(Event.ENTER_FRAME, onKeyMove);
			mykey3.removeEventListener(Event.ENTER_FRAME, onCollisionWithPlayer);
			t1.removeEventListener(TimerEvent.TIMER,onCountDown);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			trace("Events Remove");
		}
		public function gameover_level3():void
		{
			soundch_level3.stop();//to stop the music
			removeEvent();
			
			s12=new sound_GameOver;
			soundch_GameOver2=new SoundChannel;
			soundch_GameOver2=s12.play();// to play the music
			
			gameover = new GameOver;
			addChild(gameover);
			
			gameover.score.text=myscore+"";
			gameover.btnagain.addEventListener(MouseEvent.CLICK,OnAgainClick);
		}
		public function OnAgainClick(event:MouseEvent):void
		{
			soundch_GameOver2.stop();
			
			var level3:Level3;
			removeChild(gameover);
			level3 = new Level3(s);
			addChild(level3);
			gameover.score.text=myscore+"";
			gameover.btnagain.removeEventListener(MouseEvent.CLICK,OnAgainClick);
		}
		public function checkCoin():void 
		{
			if (player.hitTestPoint(coin1.x,coin1.y,true) && (coin1.visible==true)) 
			{
				//trace("1");
				//coin1.visible=false;//if i use this the score keeps on increasing
				coin1.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			} 
			else if (player.hitTestPoint(coin2.x,coin2.y,true) && (coin2.visible==true)) 
			{
				coin2.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			} 
			else if (player.hitTestPoint(coin3.x,coin3.y,true) && (coin3.visible==true)) 
			{
				coin3.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			} 
			else if (player.hitTestPoint(coin4.x,coin4.y,true) && (coin4.visible==true)) 
			{
				coin4.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			} 
			else if (player.hitTestPoint(coin5.x,coin5.y,true) && (coin5.visible==true))
			{
				coin5.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			}
			else if (player.hitTestPoint(coin6.x,coin6.y,true) && (coin6.visible==true)) 
			{
				coin6.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			} 
			else if (player.hitTestPoint(coin7.x,coin7.y,true) && (coin7.visible==true)) 
			{
				coin7.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			} 
			else if (player.hitTestPoint(coin8.x,coin8.y,true) && (coin8.visible==true))
			{
				coin8.visible=false;
				myscore=myscore+10;
				score.text=myscore+"";
			}
		}
		private function onEnterFrame(event:Event):void
		{
			checkCoin();
			//Player vs platform collision
			for (var i:int = 0; i <= 30; i++) 
			{
				Collision.playerAndPlatform(player, this["platform" + i], 0.2, 0);
				//trace("platform" + i);
			}
			if(player.hitTestObject(mydragon))
			{
				player.meter.width-=2;
				trace(player.meter.width);
				//checkGameOver();
			}
			if(player.meter.width == 0 )
			{
				trace("game over due to health");
				gameover_level3();
			}
		}
	}
}