package com.ghostmonk.net {
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/** 
	 * Loads in a specified web text resource and returns the results as a 
	 * string to the specified complete Call-back Function
	 * 
	 * <p>There is no need to hold a reference to this object as it deals 
	 * with complete clean up internally either on load completion or on error.</p> 
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class SimpleURLLoader extends URLLoader {
		
		
		
		private var _complete:Function;
		private var _error:Function;
		
		
		
		/**
		 * 
		 * @param request - location of desired web resource 
		 * @param completeCall - function called on load complete. Data on the event result is passed as the only parameter
		 * @param errorCall - optional function to call in case of error. Cleanup is invoked on IOErrorEvent
		 * 
		 */
		public function SimpleURLLoader( request:URLRequest, completeCall:Function, errorCall:Function = null) {
			
			_complete = completeCall;
			_error = errorCall;
			
			addEventListener(Event.COMPLETE, onComplete);
			addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			super(request);
			
		}
		
		
		
		private function onIOError(e:IOErrorEvent):void {
			
			if(_error != null) {
				_error(e);
			}
			
			cleanup();
			
		}
		
		
		
		private function onComplete(e:Event):void {
			
			_complete(data);
			cleanup();
			
		}
		
		
		
		private function cleanup():void {
			
			addEventListener(Event.COMPLETE, onComplete);
			addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			delete this;
			
		}
		
		
		
	}
}