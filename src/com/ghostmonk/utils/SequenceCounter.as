package com.ghostmonk.utils {
	
	/**
	 * Useful for managing sequential values based on a desired variance. 
	 * Tracks in both a positive or negative direction. Variance can be set and read at anytime. 
	 * @author ghostmonk 10/04/2009
	 * 
	 */
	public class SequenceCounter {
		
		
		private var _variance:Number;
		private var _current:Number;
		
		
		
		/**
		 * 
		 * @param start The value to start the sequence
		 * @param variance The dfference between successive increment/decrement calls
		 * 
		 */
		public function SequenceCounter( start:Number = 0, variance:Number = 1 ) {
			
			_current = start;
			_variance = variance;
			
		}
		
		
		
		/**
		 * Retrieve and set the variance. This is useful for tweening engines that need to know and set values.
		 * @param value
		 * 
		 */
		public function set variance( value:Number ):void {
			
			_variance = value;
			
		}
		
		
		
		/**
		 * Retrieve and set the variance. This is useful for tweening engines that need to know and set values.
		 * @return 
		 * 
		 */
		public function get variance():Number {
			
			return _variance;
			
		}
		
		
		
		/**
		 * Retrieve the current value then increment by the value of variance
		 * @return 
		 * 
		 */
		public function get increment():Number {
			
			_current += _variance;
			return _current - _variance;
			
		}
		
		
		
		/**
		 * Retrieve the current value then decrement by the value of variance
		 * @return 
		 * 
		 */
		public function get decrement():Number {
			
			_current -= _variance;
			return _current + _variance;
			
		}



	}
}