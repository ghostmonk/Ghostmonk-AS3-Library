package com.ghostmonk.ui.composed {
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class ClickableSprite {
		
		
		private var _view:Sprite;
		private var _clickCall:Function;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get view():Sprite {
			
			return _view;
			
		}
		
		
		
		/**
		 * 
		 * @param display
		 * @param clickCall
		 * 
		 */
		public function ClickableSprite( view:Sprite, clickCall:Function ) {
			
			_clickCall = clickCall;
			view.mouseChildren = false;
			_view = view;
			enable();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_view.buttonMode = true;
			_view.addEventListener( MouseEvent.CLICK, onClick );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_view.buttonMode = false;
			_view.removeEventListener( MouseEvent.CLICK, onClick );
			
		}
		
		
		
		private function onClick( e:MouseEvent ):void {
			
			_clickCall( e );
			
		} 
		
		
		
	}
}