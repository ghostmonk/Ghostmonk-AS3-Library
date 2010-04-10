package com.ghostmonk.ui.graveyard.idecomposed {
	
	import com.ghostmonk.ui.graveyard.buttons.FrameLabelButton;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class ClickActionButton {
		
		
		
		private var _clip:FrameLabelButton;
		
		private var _callBack:Function;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get view():MovieClip {
			
			return _clip.view;
			
		}
		
		
		
		/**
		 * 
		 * @param clip
		 * @param callBack
		 * 
		 */
		public function ClickActionButton( clip:MovieClip, callBack:Function ) {
			
			_clip = new FrameLabelButton( clip );
			_callBack = callBack;
			enable();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_clip.enable();
			_clip.view.addEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_clip.disable();
			_clip.view.removeEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		private function onMouseClick( e:MouseEvent ):void {
			
			_callBack(e);
			
		}
		
		
		
	}
}