package com.ghostmonk.events {
	
	import flash.events.Event;

	/** 
	 * Useful for dispatching the state of an object as either true or false
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class ToggleEvent extends Event {
		
		
		
		public static const TOGGLE:String = "toggle";
		
		private var _isTrue:Boolean;
		
		
		
		/**
		 * 
		 * @param type use static values in ToggleEvent
		 * @param isTrue a boolean value signifying the state of the dispatch object
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function ToggleEvent( type:String, isTrue:Boolean, bubbles:Boolean = false, cancelable:Boolean = false ) {
			
			_isTrue = isTrue;
			super( type, bubbles, cancelable );
			
		}
		
		
		
		/**
		 * retrieve the value as either true or false
		 * 
		 * @return 
		 * 
		 */
		public function get isTrue():Boolean {
			
			return _isTrue;
			
		}
		
		
		
		override public function clone():Event {
			
			return new ToggleEvent( type, isTrue, bubbles, cancelable );
			
		}
		
	}
}