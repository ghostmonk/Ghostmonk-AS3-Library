package com.ghostmonk.media.video {
	
	
	
	import com.ghostmonk.events.PercentageEvent;
	import com.ghostmonk.media.video.events.VideoControlEvent;
	
	import flash.display.*;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	[Event(name="change", type="com.ghostmonk.events.PercentageEvent")]
	[Event(name="play", type="com.ghostmonk.events.video.VideoControlEvent")]
	[Event(name="pause", type="com.ghostmonk.events.video.VideoControlEvent")]
	
	
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class PlaybackScrubber extends EventDispatcher {
		
		
		
		private var _min:Number;
		private var _max:Number;
			
		private var _playHead:Sprite;
		private var _track:Sprite;
		private var _container:Sprite;
		
		private var _trackWidth:Number;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get container():Sprite { 
			
			return _container; 
			
		}
		
		
		
		/**
		 * 
		 * @param container
		 * @param playhead
		 * @param track
		 * 
		 */
		public function PlaybackScrubber( container:Sprite, playhead:Sprite, track:Sprite ) {
			
			_container = container;
			_playHead = playhead;
			_track = track;
			
			_trackWidth = _track.width - _playHead.width;
			
			enable();
			
			_min = _track.x + _playHead.width/2;
			_max = _track.x + _track.width - _playHead.width/2;
			 
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_playHead.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			_playHead.buttonMode = true;
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_playHead.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			_playHead.buttonMode = false;
			
		}
		
		
		
		/**
		 * 
		 * @param percent
		 * 
		 */
		public function onLoad( percent:Number ):void {
			
			_track.scaleX = percent;
			
		}
		
		
		
		/**
		 * 
		 * @param percent
		 * 
		 */
		public function setScrubber( percent:Number ):void {
			
			var setX:Number = _trackWidth*percent + _playHead.width/2;
			_playHead.x = Math.max( _min, Math.min( _max, setX ) );
			
		}
		
		
		
		private function onMouseDown( e:MouseEvent ):void {
			
			dispatchEvent( new VideoControlEvent( VideoControlEvent.PAUSE ) );
			_playHead.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			_playHead.stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
		
		private function onMouseUp( e:MouseEvent ):void {
			
			dispatchEvent( new VideoControlEvent( VideoControlEvent.PLAY ) );
			_playHead.stage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			_playHead.stage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
		
		private function onMouseMove( e:MouseEvent ):void {
			
			_playHead.x = Math.max( _min, Math.min( _max, _container.mouseX ) );
			dispatchEvent(new PercentageEvent( PercentageEvent.CHANGE, ( _playHead.x - ( _playHead.width/2 ) )/_trackWidth ) );
			
		}
		
		

	}
}