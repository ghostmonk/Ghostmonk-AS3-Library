package com.ghostmonk.media.video.ui {
	
	
	
	import com.ghostmonk.events.PercentageEvent;
	import com.ghostmonk.media.video.events.VideoControlEvent;
	
	import flash.display.*;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	[Event(name="change", type="com.indusblue.events.PercentageEvent")]
	[Event(name="play", type="com.indusblue.media.video.events.VideoControlEvent")]
	[Event(name="pause", type="com.indusblue.media.video.events.VideoControlEvent")]
	
	
	
	/** 
	 * @author ghostmonk 09/05/2009
	 * 
	 */
	public class SimpleVideoScrubber extends EventDispatcher {
		
		
		private var _container:Sprite;
		private var _playbackMeter:Sprite;
		private var _loadProgress:Sprite;
		
		
		
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
		 * @param playbackMeter
		 * @param loadProgress
		 * 
		 */
		public function SimpleVideoScrubber( container:Sprite, playbackMeter:Sprite, loadProgress:Sprite ) {
			
			_container = container;
			_playbackMeter = playbackMeter;
			_loadProgress = loadProgress;
			enable();
			
			_loadProgress.scaleX =
			_playbackMeter.scaleX = 0;
			 
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_container.buttonMode = true;
			_container.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_container.buttonMode = false;
			_container.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
		}
		
		
		
		/**
		 * 
		 * @param percent
		 * 
		 */
		public function onLoad( percent:Number ):void {
			
			_loadProgress.scaleX = percent;
			
		}
		
		
		
		/**
		 * 
		 * @param percent
		 * 
		 */
		public function setScrubber( percent:Number ):void {
			
			_playbackMeter.width = Math.min( _loadProgress.width, Math.max( 0,  _container.width * percent ) );
			
		}
		
		
		
		private function onMouseDown( e:MouseEvent ):void {
			
			onMouseMove( null );
			dispatchEvent( new VideoControlEvent( VideoControlEvent.PAUSE ) );
			_container.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			_container.stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
		
		private function onMouseUp( e:MouseEvent ):void {
			
			dispatchEvent( new VideoControlEvent( VideoControlEvent.PLAY ) );
			_container.stage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			_container.stage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
		
		private function onMouseMove( e:MouseEvent ):void {
			
			_playbackMeter.width = Math.max( 0, Math.min( _loadProgress.width, _container.mouseX ) );
			dispatchEvent( new PercentageEvent( PercentageEvent.CHANGE, _playbackMeter.scaleX ) );
			
		}
		
		

	}
}