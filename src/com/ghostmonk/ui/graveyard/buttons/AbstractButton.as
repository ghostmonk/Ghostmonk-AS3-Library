package com.ghostmonk.ui.graveyard.buttons {
	
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class AbstractButton {
		
		
		
		protected var _view:Sprite;
		private var _mouseClickCall:Function;
		
		
		
		/**
		 * 
		 * @param view
		 * @param mouseClickCall
		 * 
		 */
		public function AbstractButton( view:Sprite, mouseClickCall:Function ) {
			
			_view = view;
			_mouseClickCall = mouseClickCall;
			enable();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_view.buttonMode = true;
			_view.addEventListener( MouseEvent.CLICK, onClick );
			_view.addEventListener( MouseEvent.ROLL_OVER, onRollover );
			_view.addEventListener( MouseEvent.ROLL_OUT, onRollout );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_view.buttonMode = false;
			_view.removeEventListener( MouseEvent.CLICK, onClick );
			_view.removeEventListener( MouseEvent.ROLL_OVER, onRollover );
			_view.removeEventListener( MouseEvent.ROLL_OUT, onRollout );
			
		}
		
		
		
		/**
		 * 
		 * @param e
		 * 
		 */
		protected function onRollover( e:MouseEvent ):void {
			
		}
		
		
		
		/**
		 * 
		 * @param e
		 * 
		 */
		protected function onRollout( e:MouseEvent ):void {
				
		}
		
		
		
		private function onClick( e:MouseEvent ):void {
			
			_mouseClickCall( e );
			
		}
		
		
		
	}
}