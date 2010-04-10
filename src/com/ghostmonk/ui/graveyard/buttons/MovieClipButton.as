package com.ghostmonk.ui.graveyard.buttons {
	
	import caurina.transitions.*;
	
	import com.ghostmonk.ui.graveyard.idecomposed.ClickActionButton;
	
	import flash.display.*;
	
	/**
	 * 
	 * This class composits movieclips with button behaviour
	 * <p>Tweener must be included for operation</p>
	 * <p>frame 1 is mouseOut, totalframes is mouseover</p>
	 * <p>All effects (transitions etc) are to be created on the timeline as linear transitions are used to move the playhead</p> 
	 *  
	 * @author ghostmonk 22/11/2008
	 * 
	 */
	public class MovieClipButton extends Sprite {
		
		
		
		private var _clip:ClickActionButton;
		
		
		public function get view():MovieClip {
			return _clip.view;
		}
		
		
		/**
		 * 
		 * @param clip
		 * @param callback
		 * 
		 */
		public function MovieClipButton( clip:MovieClip, callback:Function ) {
			
			_clip = new ClickActionButton( clip, callback );
			
			addChild( _clip.view );
			
			enable();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_clip.enable();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_clip.disable();
			
		}



	}
}