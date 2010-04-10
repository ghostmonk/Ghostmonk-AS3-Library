package com.ghostmonk.events.audio {
	
	import flash.events.Event;
	import flash.media.ID3Info;

	/**
	 * Use this when you need meta information from loading audio 
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class AudioEvent extends Event {
		
		
		
		public static const ON_ID3:String = "onId3";
		
		private var _id3:ID3Info;
		
		
		
		/**
		 * 
		 * @param type use static constants in AudioEvent
		 * @param id3 pass in loaded ID3Info from loaded audio
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function AudioEvent( type:String, id3:ID3Info, bubbles:Boolean = false, cancelable:Boolean = false ) {
			
			super( type, bubbles, cancelable );
			_id3 = id3;
			
		}
		
		
		
		/**
		 * Retrieve ID3Info when event fires 
		 *  
		 * @return 
		 * 
		 */
		public function get id3():ID3Info {
			
			return _id3;
			
		}
		
		
		
		override public function clone():Event {
			
			return new AudioEvent( type, id3, bubbles, cancelable );
			
		}
		
		
		
	}
}