package com.ghostmonk.errorEvents
{
	import flash.events.ErrorEvent;
	import flash.events.Event;

	public class LoadingError extends ErrorEvent
	{
		public static const LOADING_IN_PROGRESS:String = "loadingInProgress";
		
		public function LoadingError( type:String, msg:String, bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super(type, bubbles, cancelable, text);
		}
		
		override public function clone() : Event
		{
			return new LoadingError( type, text, bubbles, cancelable );
		}
	}
}