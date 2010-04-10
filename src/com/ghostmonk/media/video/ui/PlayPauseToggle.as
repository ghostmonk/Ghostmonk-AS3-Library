package com.ghostmonk.media.video.ui {
	
	import com.ghostmonk.media.video.events.VideoControlEvent;
	import com.ghostmonk.ui.graveyard.buttons.MovieClipButton;
	
	import flash.display.*;
	import flash.events.*;
	
	[Event(name="play", type="com.indusblue.media.video.events.VideoControlEvent")]
	[Event(name="pause", type="com.indusblue.media.video.events.VideoControlEvent")]
	
	
	
	/** 
	 * This toggles and dispatches events for pausing and playing video
	 *  
	 * @author ghostmonk 18/11/2008
	 * 
	 */
	public class PlayPauseToggle extends EventDispatcher {
		
		
		
		private var _playButton:MovieClipButton;
		private var _pauseButton:MovieClipButton;
		private var _parent:DisplayObjectContainer;
		
		
			
		
		/**
		 * 
		 * @param play
		 * @param pause
		 * 
		 */
		public function PlayPauseToggle( parent:DisplayObjectContainer, playClip:MovieClip, pauseClip:MovieClip ) {
			
			_parent = parent;
			_playButton = new MovieClipButton( playClip, onPlay );
			_pauseButton = new MovieClipButton( pauseClip, onPause );
			
		}
		
		
		public function set play( showPlay:Boolean ):void {
			
			if( showPlay ) {
				setView( _playButton, _pauseButton );
			}
			else {
				setView( _pauseButton, _playButton );
			}
			
		}
		
			
		private function setView( removeButton:MovieClipButton, addButton:MovieClipButton ):void {
			
			removeButton.disable();
			addButton.enable();
			_parent.addChild( addButton.view );
			if( removeButton.view.parent ) { 
				_parent.removeChild( removeButton.view );	
			}
			
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