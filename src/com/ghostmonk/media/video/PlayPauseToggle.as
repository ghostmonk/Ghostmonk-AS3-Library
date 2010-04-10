package com.ghostmonk.media.video {
	
	import com.ghostmonk.media.video.events.VideoControlEvent;
	import com.ghostmonk.ui.graveyard.buttons.MovieClipButton;
	
	import flash.display.*;
	import flash.events.*;
	
	[Event(name="play", type="com.ghostmonk.events.VideoControlEvent")]
	[Event(name="pause", type="com.ghostmonk.events.VideoControlEvent")]
	
	
	
	/** 
	 * This toggles and dispatches events for pausing and playing video
	 *  
	 * @author ghostmonk 18/11/2008
	 * 
	 */
	public class PlayPauseToggle extends Sprite {
		
		
		
		private var _playButton:MovieClipButton;
		private var _pauseButton:MovieClipButton;
		
		
			
		/**
		 * 
		 * @param play
		 * @param pause
		 * @param showPlay
		 * 
		 */
		public function PlayPauseToggle( play:MovieClip, pause:MovieClip, showPlay:Boolean = true ) {
			
			_playButton = new MovieClipButton( play, onPlay );
			_pauseButton = new MovieClipButton( pause, onPause );
			
			if( showPlay ) {
				addChild( _playButton );
			}
			else {
				addChild( _pauseButton );
			}
			
		}
		
		
			
		private function setView(clip0:MovieClipButton, clip1:MovieClipButton):void {
			
			clip0.disable();
			clip1.enable();
			addChild(clip1);
			
		}
		
		
		
		private function onPlay( e:Event ):void {
			
			setView( _playButton, _pauseButton );
			dispatchEvent( new VideoControlEvent( VideoControlEvent.PLAY ) );
			
		}
		
		private function onPause( e:Event ):void {
			
			setView( _pauseButton, _playButton );
			dispatchEvent( new VideoControlEvent( VideoControlEvent.PAUSE ) );
			
		}
		
	}
}