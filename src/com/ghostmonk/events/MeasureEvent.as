package com.ghostmonk.events
{
	import flash.events.Event;

	/** 
	 * Useful event for dispatching changes in size, very basic passing around a Number value.
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class MeasureEvent extends Event {
		
		
		
		public static const HEIGHT_READY:String = "heightReady";
		public static const HEIGHT_CHANGE:String = "heightChange";
		public static const VALUE_CHANGE:String = "valueChange";
		
		private var _value:Number;
		
		
		
		/**
		 * retrieve measurement value 
		 *  
		 * @return 
		 * 
		 */
		public function get value():Number {
			
			return _value;
			
		}
		
		
		
		/**
		 * 
		 * @param type use static constants contained in MeasureEvent
		 * @param value the value of the new measurement
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function MeasureEvent( type:String, value:Number, bubbles:Boolean = false, cancelable:Boolean = false ) {
			
			_value = value;
			super( type, bubbles, cancelable );
			
		}
		
		
		
		override public function clone():Event {
			
			return new MeasureEvent( type, value, bubbles, cancelable );
			
		}
		
		
		
	}
}