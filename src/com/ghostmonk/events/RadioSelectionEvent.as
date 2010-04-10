package com.ghostmonk.events {
	
	import flash.events.Event;

	public class RadioSelectionEvent extends Event {
		
		
		
		public static const RADIO_SELECTION:String = "radioSelection";
		
		private var _id:int;
		private var _isSelected:Boolean;
		
		
		
		
		public function RadioSelectionEvent( type:String, isSelected:Boolean, id:int, bubbles:Boolean = false, cancelable:Boolean = false ) {
			
			_id = id;
			_isSelected = isSelected;
			super( type, bubbles, cancelable );
			
		}
		
		
		
		public function get id():int {
			
			return  _id;
			
		}
		
		
		
		public function get isSelected():Boolean {
			
			return _isSelected;
			
		}
		
		
		
		override public function clone():Event {
			
			return new RadioSelectionEvent( type, isSelected, id, bubbles, cancelable );
			
		}
		
		
		
	}
}