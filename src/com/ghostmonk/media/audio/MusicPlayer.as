package com.ghostmonk.media.audio {
	
	import com.ghostmonk.events.audio.AudioEvent;
	import com.ghostmonk.media.video.events.CustomNetStreamEvent;
	
	import flash.events.*;
	import flash.media.*;
	import flash.net.URLRequest;
	
	[Event (name="stop", type="com.ghostmonk.events.video.NetStreamEvent")]
	
	
	
	/** 
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class MusicPlayer extends EventDispatcher {
		
		
		
		private var _soundPlayer:Sound;
		private var _id3:ID3Info;
		private var _channel:SoundChannel;
		private var _pausePosition:int;
		private var _context:SoundLoaderContext;
		
		private var _isReady:Boolean;
		private var _isPlaying:Boolean;
		
		
		
		/**
		 * 
		 * 
		 */
		public function MusicPlayer() {
			
			_isReady = false;
			_isPlaying = false;
			_context = new SoundLoaderContext( 1, true );
			createNewSound();
			
		}
		
		
		
		/**
		 * Pause playback and store current paused position
		 * 
		 */
		public function pause():void {
			
			_pausePosition = _channel.position;
			_channel.stop();
			_isPlaying = false;
			
		}
		
		
		
		/**
		 * retrieve the bytes loaded by percent
		 * 
		 * @return 
		 * 
		 */
		public function get percentLoaded():Number {
			
			return _soundPlayer.bytesTotal ? _soundPlayer.bytesLoaded / _soundPlayer.bytesTotal : 0;
			
		}
		
		
		
		/**
		 * Return the total duration in Seconds
		 * 
		 * @return 
		 * 
		 */
		public function get duration():Number {
			
			var dur:Number = ( _soundPlayer.length / ( _soundPlayer.bytesLoaded / _soundPlayer.bytesTotal ) ) / 1000;
			
			if( dur < 0 ) {
				dur = 0;
			}
			
			return dur;
			
		}
		
		
		
		/**
		 * Return the total length of the current sound in seconds
		 * 
		 * @return 
		 * 
		 */
		public function get length():Number {
			
			return _soundPlayer.length/1000;
			
		}
		
		
		
		/**
		 * Return the current time of the playback in seconds 
		 * 
		 * @return 
		 * 
		 */
		public function get time():Number {
				
			return _channel.position/1000;
			
		}
		
		
		
		/**
		 * Resume playback at paused postion
		 * 
		 */
		public function play():void {
			
			if(!_isPlaying) {
				_channel = _soundPlayer.play( _pausePosition );
			}
			_isPlaying = true;
			
		}
		
		
		
		/**
		 * Seek to a specified position in the sound asset by seconds
		 * 
		 * @param seconds Time in seconds where to fast forward to
		 * 
		 */
		public function seek( seconds:Number ):void {
			
			_channel.stop();
			_channel = _soundPlayer.play( seconds * 1000 ); 
			
		}
		
		
		
		/**
		 * 
		 * 
		 * 
		 * @param url network resource of sound file
		 * 
		 */
		public function load( url:String ):void {
			
			SoundMixer.stopAll();
			_channel.stop();
			_isPlaying = false;
			createNewSound();
			_soundPlayer.load( new URLRequest( url ) );
			play();
			
			_channel.addEventListener( Event.ACTIVATE, onChannelActivate );
			_channel.addEventListener( Event.DEACTIVATE, onChannelDeactivate );
			_channel.addEventListener( Event.SOUND_COMPLETE, onChannelComplete );
			
		}
		
		
		
		/**
		 * stop and close channel
		 * 
		 */
		public function close():void {
			
			_channel.stop();
			
		}
		
		
		
		private function createNewSound():void {
			
			try {
				_soundPlayer.close()
			}
			catch( e:Error ) {
				trace( e.name );
			}
			
			_pausePosition = 0;
			_soundPlayer = null;
			_channel = null;
			
			_soundPlayer = new Sound();
			_channel = new SoundChannel();
			
			_soundPlayer.addEventListener( Event.ACTIVATE, onSoundActivate );
			_soundPlayer.addEventListener( Event.DEACTIVATE, onSoundDeactivate );
			_soundPlayer.addEventListener( Event.COMPLETE, onComplete );
			_soundPlayer.addEventListener( Event.ID3, onID3 );
			_soundPlayer.addEventListener( Event.OPEN, onOpen );
			_soundPlayer.addEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_soundPlayer.addEventListener( ProgressEvent.PROGRESS, onProgress );
			
		}
		
		
		
		private function onChannelActivate( e:Event ):void {
			
			trace( "channel activate" );
			
		}
		
		
		
		private function onChannelDeactivate( e:Event ):void {
			
			trace( "channel deactivagte" );
			
		}
		
		
		
		private function onChannelComplete( e:Event ):void {
			
			trace( "channel complete" );
			dispatchEvent( new Event( "stop" ) );
			
		}
		
		
		
		private function onSoundActivate( e:Event ):void {
			
			trace( "sound activate" );
			
		}
		
		
		
		private function onSoundDeactivate( e:Event ):void {
			
			trace( "sound deactivate" );
			
		}
		
		
		
		private function onComplete( e:Event ):void {
			
			trace( "sound complete" );
			
		}
		
		
		
		private function onID3( e:Event ):void {
			
			_id3 = _soundPlayer.id3;
			dispatchEvent( new AudioEvent( AudioEvent.ON_ID3, _id3 ) );
		}
		
		
		
		private function onOpen( e:Event ):void {
			
			trace( "on open" );
				
		}
		
		
		
		private function onIOError( e:IOErrorEvent ):void {
			
			trace( "on IOError" );
			
		}
		
		
		
		private function onProgress( e:ProgressEvent ):void {
			
			//trace("onProgress");
			
		}



	}
}