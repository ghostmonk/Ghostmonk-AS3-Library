package com.ghostmonk.calculate {
	
	/**
	 * Simple calculation class to convert common time units
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class Time {
		
		
		/**
		 * Calculate minutes from seconds
		 * 
		 * @param seconds 
		 * @return 
		 * 
		 */
		public static function secondsToMinutes( seconds:Number ):Number {
			
			return seconds / 60;
			
		}
		
		
		
		/**
		 * Calculates seconds from milliseconds
		 * 
		 * @param milliseconds 
		 * @return 
		 * 
		 */
		public static function milliToSeconds ( milliseconds:Number ):Number {
			
			return milliseconds / 1000;
			
		}
		
		
		
		/**
		 * Calculates hours from minutes
		 *  
		 * @param minutes
		 * @return 
		 * 
		 */
		public static function minutesToHours( minutes:Number ):Number {
			
			return minutes / 60;
			
		}
		
		

	}
}