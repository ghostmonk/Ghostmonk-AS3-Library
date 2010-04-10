package com.ghostmonk.events {
	
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 * Dispatches an event 
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class PointValueEvent extends Event {
		
		public static const POINT_UPDATE:String = "pointUpdate";
		public static const POINT_PERCENT:String = "pointPercent";
		
		private var _point:Point;
		

		public function get point():Point {
			
			return _point;
			
		}
		
			
		/**
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function PointValueEvent( type:String, point:Point, bubbles:Boolean = false, cancelable:Boolean = false ) {
			
			_point = point;
			super( type, bubbles, cancelable );
			
		}
		
		override public function clone():Event {
			
			return new PointValueEvent( type, point, bubbles, cancelable ); 
			
		}
		
	}
}