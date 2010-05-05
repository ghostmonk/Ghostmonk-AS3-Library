package com.ghostmonk.events
{
	import flash.events.Event;
	
	public class IDEvent extends Event
	{
		public static const UPDATE:String = "IDEventUpdate"
		
		private var _id:Number;
		
		public function IDEvent( type:String, id:Number, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			_id = id;
			super( type, bubbles, cancelable );
		}
		
		public function get id() : Number
		{
			return _id;
		}
		
		override public function clone() : Event
		{
			return new IDEvent( type, id, bubbles, cancelable );
		}

	}
}