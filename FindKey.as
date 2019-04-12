package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.FontStyle;
	import flash.display.Stage;
	import flash.media.Sound ;
	import flash.media.SoundChannel ;

	public class FindKey extends MovieClip
	{
		var myscore:uint;
		var s:Stage;
		//var mykey:uint;
		var guess_remain:uint;
		var gamestatus:String;
		var startmsg:String;
		var flag:uint;
		var gamestart:GameStart;
		//Declaring variable for sound
		var s4:sound_level1;
		var soundch_level1:SoundChannel;
		var s5:sound_Yay;
		var soundch_Yay:SoundChannel;
		var s6:sound_GameOver;
		var soundch_GameOver:SoundChannel;
		
		public function FindKey(stage:Stage) 
		{
			btntryagain.visible=false;
			btnclickhere.visible=false;
			s=stage;
			//adding sound to level 1 page
			s4=new sound_level1;
			soundch_level1=new SoundChannel;
			soundch_level1=s4.play();// to play the music
			
			chan.gotoAndStop("think");
			startmsg="Find the hidden Keys!!\n You have only 10 Chances!!";
			myscore=100;
			//mykey=0;
			guess_remain=10;
			flag=0;
			output.text=startmsg;
			score.text=myscore+"";
			//key.text=mykey+"";
			remain_guess.text=guess_remain+"";
			b1.stop();
			b2.stop();
			b3.stop();
			b4.stop();
			b5.stop();
			b6.stop();
			b7.stop();
			b8.stop();
			b9.stop();
			b10.stop();
			b11.stop();
			b12.stop();
			b13.stop();
			b14.stop();
			b15.stop();
			b16.stop();
			b17.stop();
			b18.stop();
			b19.stop();
			b20.stop();
			b1.addEventListener(MouseEvent.CLICK,b1Click);
			b2.addEventListener(MouseEvent.CLICK,b2Click);
			b3.addEventListener(MouseEvent.CLICK,b3Click);
			b4.addEventListener(MouseEvent.CLICK,b4Click);
			b5.addEventListener(MouseEvent.CLICK,b5Click);
			b6.addEventListener(MouseEvent.CLICK,b6Click);
			b7.addEventListener(MouseEvent.CLICK,b7Click);
			b8.addEventListener(MouseEvent.CLICK,b8Click);
			b9.addEventListener(MouseEvent.CLICK,b9Click);
			b10.addEventListener(MouseEvent.CLICK,b10Click);
			b11.addEventListener(MouseEvent.CLICK,b11Click);
			b12.addEventListener(MouseEvent.CLICK,b12Click);
			b13.addEventListener(MouseEvent.CLICK,b13Click);
			b14.addEventListener(MouseEvent.CLICK,b14Click);
			b15.addEventListener(MouseEvent.CLICK,b15Click);
			b16.addEventListener(MouseEvent.CLICK,b16Click);
			b17.addEventListener(MouseEvent.CLICK,b17Click);
			b18.addEventListener(MouseEvent.CLICK,b18Click);
			b19.addEventListener(MouseEvent.CLICK,b19Click);
			b20.addEventListener(MouseEvent.CLICK,b20Click);
			
		}
		public function tryagain(event:MouseEvent):void
		{
			soundch_GameOver.stop();//to stop the music
			//var gamestart:GameStart;
			gamestart = new GameStart(s);
			addChild(gamestart);
		}
		public function ClickHere(event:MouseEvent):void
		{
			soundch_Yay.stop();//to stop the music
			var carFight:CarFight;
			carFight = new CarFight(s);
			addChild(carFight);
		}
		function b1Click(event:MouseEvent):void //Bomb
		{
			b1.gotoAndStop("vanish");
			myscore=myscore-10;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b2Click(event:MouseEvent):void 
		{
			b2.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b3Click(event:MouseEvent):void //Key
		{
			b3.gotoAndStop("vanish");
			//mykey=mykey+10;
			//key.text=mykey+"";
			myscore=myscore+20;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			flag=flag+1;
			CheckGameOver();
			CheckRemainingKey();
			
		}
		function b4Click(event:MouseEvent):void 
		{
			b4.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b5Click(event:MouseEvent):void 
		{
			b5.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b6Click(event:MouseEvent):void //BonusKey
		{
			b6.gotoAndStop("vanish");
			//mykey=mykey+20;
			//key.text=mykey+"";
			myscore=myscore+30;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			flag=flag+1;
			CheckGameOver();
			CheckRemainingKey();
		}
		function b7Click(event:MouseEvent):void //Bomb
		{
			b7.gotoAndStop("vanish");
			myscore=myscore-10;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b8Click(event:MouseEvent):void 
		{
			b8.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b9Click(event:MouseEvent):void //Key
		{
			b9.gotoAndStop("vanish");
			//mykey=mykey+10;
			//key.text=mykey+"";
			myscore=myscore+20;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			flag=flag+1;
			CheckGameOver();
			CheckRemainingKey();
		}
		function b10Click(event:MouseEvent):void 
		{
			b10.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b11Click(event:MouseEvent):void 
		{
			b11.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b12Click(event:MouseEvent):void //Bomb
		{
			b12.gotoAndStop("vanish");
			myscore=myscore-10;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b13Click(event:MouseEvent):void //Bomb
		{
			b13.gotoAndStop("vanish");
			myscore=myscore-10;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b14Click(event:MouseEvent):void 
		{
			b14.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b15Click(event:MouseEvent):void //Key
		{
			b15.gotoAndStop("vanish");
			//mykey=mykey+10;
			//key.text=mykey+"";
			myscore=myscore+20;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			flag=flag+1;
			CheckGameOver();
			CheckRemainingKey();
		}
		function b16Click(event:MouseEvent):void 
		{
			b16.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b17Click(event:MouseEvent):void 
		{
			b17.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b18Click(event:MouseEvent):void //BonusKey
		{
			b18.gotoAndStop("vanish");
			//mykey=mykey+20;
			//key.text=mykey+"";
			myscore=myscore+30;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			flag=flag+1;
			CheckGameOver();
			CheckRemainingKey();
		}
		function b19Click(event:MouseEvent):void 
		{
			b19.gotoAndStop("vanish");
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function b20Click(event:MouseEvent):void //Bomb
		{
			b20.gotoAndStop("vanish");
			myscore=myscore-10;
			score.text=myscore+"";
			guess_remain--;
			remain_guess.text=guess_remain+"";
			CheckGameOver();
		}
		function CheckRemainingKey():void
		{
			trace("checkremain");
			if(flag == 1)
			{
				trace("1");
				startmsg="Still 4 Keys Remaining!!";
				output.text=startmsg;
			}
			else if(flag == 2)
			{
				trace("2");
				startmsg="Still 3 Keys Remaining!!";
				output.text=startmsg;
			}
			else if(flag == 3)
			{
				trace("3");
				startmsg="Still 2 Keys Remaining!!";
				output.text=startmsg;
			}
			else if(flag == 4)
			{
				trace("4");
				startmsg="Still 1 Keys Remaining!!";
				output.text=startmsg;
			}
			else if(flag == 5)
			{
				trace("5");
				CheckGameOver();
			}
		}
		function CheckGameOver():void
		{
			trace("CheckGameOver");
			if(guess_remain < 1 || flag == 5)
			{
				trace("Inside If Condition");
				GameOver();
			}
			function GameOver():void
			{
				trace("GameOver");
				//addChild(gameoverKey);
				if(flag == 5)
				{
					removeEvent();
					soundch_level1.stop();//to stop the music
					
					s5=new sound_Yay;
					soundch_Yay=new SoundChannel;
					soundch_Yay=s5.play();// to play the music
					
					chan.gotoAndStop("happy");
					startmsg="Congrats!!\n You Have Found All Keys!!";
					guess_remain=0;
					remain_guess.text=guess_remain+"";
					output.text=startmsg;
					score.text=myscore+"";
					//key.text=mykey+"";
					btnclickhere.visible=true;
					btnclickhere.addEventListener(MouseEvent.CLICK,ClickHere);
				}
				else
				{
					removeEvent();
					soundch_level1.stop();//to stop the music
					
					s6=new sound_GameOver;
					soundch_GameOver=new SoundChannel;
					soundch_GameOver=s6.play();// to play the music
					
					chan.gotoAndStop("sad");
					startmsg="Muhahaha!!\n You Didn't Find All the Keys !!";
					guess_remain=0;
					remain_guess.text=guess_remain+"";
					output.text=startmsg;
					score.text=myscore+"";
					//key.text=mykey+"";
					btntryagain.visible=true;
					btntryagain.addEventListener(MouseEvent.CLICK,tryagain);
				}
				function removeEvent():void
				{
					b1.removeEventListener(MouseEvent.CLICK,b1Click);
					b2.removeEventListener(MouseEvent.CLICK,b2Click);
					b3.removeEventListener(MouseEvent.CLICK,b3Click);
					b4.removeEventListener(MouseEvent.CLICK,b4Click);
					b5.removeEventListener(MouseEvent.CLICK,b5Click);
					b6.removeEventListener(MouseEvent.CLICK,b6Click);
					b7.removeEventListener(MouseEvent.CLICK,b7Click);
					b8.removeEventListener(MouseEvent.CLICK,b8Click);
					b9.removeEventListener(MouseEvent.CLICK,b9Click);
					b10.removeEventListener(MouseEvent.CLICK,b10Click);
					b11.removeEventListener(MouseEvent.CLICK,b11Click);
					b12.removeEventListener(MouseEvent.CLICK,b12Click);
					b13.removeEventListener(MouseEvent.CLICK,b13Click);
					b14.removeEventListener(MouseEvent.CLICK,b14Click);
					b15.removeEventListener(MouseEvent.CLICK,b15Click);
					b16.removeEventListener(MouseEvent.CLICK,b16Click);
					b17.removeEventListener(MouseEvent.CLICK,b17Click);
					b18.removeEventListener(MouseEvent.CLICK,b18Click);
					b19.removeEventListener(MouseEvent.CLICK,b19Click);
					b20.removeEventListener(MouseEvent.CLICK,b20Click);
				}
			}
		}
	}
}