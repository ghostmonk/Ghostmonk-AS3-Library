package com.ghostmonk.ui.graveyard {
	
	import flash.text.TextField;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class TimeDisplay {
		
		
		
		private var _display:TextField;
		
		private var _duration:Number;
		private var _totalTime:String;
		private var _currentTime:String;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get view():TextField {
			
			return _display;
			
		}
		
		
		
		/**
		 * 
		 * @param textField
		 * 
		 */
		public function TimeDisplay( textField:TextField ) {
			
			_display = textField;
			reset( true );
			
		}
		
		
		
		/**
		 * 
		 * @param totalReset
		 * 
		 */
		public function reset( totalReset:Boolean = false ):void {
			
			if( totalReset ) {
				_totalTime = "00:00";
			}
			
			_currentTime = "00:00";
			renderTime();
			
		}
		
		
		
		/**
		 * 
		 * @param percent
		 * 
		 */
		public function setTimeByPercent( percent:Number ):void {
			
			if( !_duration ) {
				throw new Error("please set total duration before attempting to use setTimeByPercent in com.ghostmonk.ui.TimeDisplay");
			}
			
			_currentTime = calculateTime( percent * _duration );
			
			renderTime();
			
		}
		
		
		
		/**
		 * 
		 * @param seconds
		 * 
		 */
		public function setTime( seconds:Number ):void {
			
			_currentTime = calculateTime( seconds );
			renderTime();
			
		}
		
		
		
		/**
		 * 
		 * @param seconds
		 * 
		 */
		public function setTotalTime( seconds:Number ):void {
			
			_duration = seconds;
			_totalTime = calculateTime( seconds );
			renderTime();
			
		}
		
		
		
		private function renderTime():void {
			
			_display.text = _currentTime + " | " + _totalTime;
			
		}
		
		
		
		private function calculateTime( time:Number ):String {
			
			var minutes:Number = Math.floor( time/60 );
			var displayMins:String = minutes < 10 ? "0" + minutes.toString() : minutes.toString();
			
			var seconds:Number = Math.floor( time - ( minutes*60 ) );
			var displaySecs:String = seconds < 10 ? "0" + seconds.toString() : seconds.toString();
			
			return displayMins + ":" + displaySecs;
			
		}
		
		
		
	}
}