package com.ghostmonk.ui.graveyard.idecomposed {
	
	import com.ghostmonk.ui.graveyard.buttons.FrameLabelButton;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class PressActionButton {
		
		
		
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
		public function PressActionButton( clip:MovieClip, callBack:Function ) {
			
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
			_clip.addEventListener( MouseEvent.MOUSE_DOWN, onPress );
			_clip.addEventListener( MouseEvent.MOUSE_UP, onDepress );
			_clip.addEventListener( MouseEvent.ROLL_OUT, onDepress );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_clip.disable();
			_clip.removeEventListener( MouseEvent.MOUSE_DOWN, onPress );
			_clip.removeEventListener( MouseEvent.MOUSE_UP, onDepress );
			_clip.removeEventListener( MouseEvent.ROLL_OUT, onDepress );
			
		}
		
		
		
		private function onPress( e:Event ):void {
			
			_clip.view.addEventListener( Event.ENTER_FRAME, onPress );
			_callBack( e );
			
		}
		
		
		
		private function onDepress( e:Event ):void {
			
			_clip.view.removeEventListener( Event.ENTER_FRAME, onPress );
				
		}



	}
}