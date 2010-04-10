package com.ghostmonk.media.video.events {
	
	import flash.events.Event;

	/**
	 * Used in video navigation system, dispatched from an object that holds a reference
	 * to a video asset url/location
	 *   
	 * @author ghostmonk 20/11/2008
	 * 
	 */
	public class VideoLoadEvent extends Event
	{
		
		
		
		public static const LOAD_VIDEO:String = "loadVideo";
		
		private var _url:String;
		
		
		
		/**
		 * Retrieve url of flv asset
		 * 
		 * @return 
		 * 
		 */
		public function get url():String {
			
			return _url;
			
		}
		
		
		
		/**
		 * 
		 * @param type use static variable VideoLoadEvent.LOAD_VIDEO
		 * @param url net location of flv
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function VideoLoadEvent( type:String, url:String, bubbles:Boolean=false, cancelable:Boolean=false ) {
			
			super( type, bubbles, cancelable );
			_url = url;
			
		}
		
		
		
		override public function clone():Event {
			
			return new VideoLoadEvent( type, url, bubbles, cancelable );
			
		}
		
		
		
	}
}