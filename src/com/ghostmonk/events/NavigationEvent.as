package com.ghostmonk.events
{
	import flash.events.Event;

	public class NavigationEvent extends Event
	{	
		private var _id:int;
		
		public function NavigationEvent( type:String, id:Number, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			_id = id;
			super( type, bubbles, cancelable );
		}
		
		public function get id() : int
		{
			return _id;
		}
		
		override public function clone() : Event
		{
			return new NavigationEvent( type, id, bubbles, cancelable );
		}
	}
}