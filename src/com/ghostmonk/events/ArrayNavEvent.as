package com.ghostmonk.events
{
	import flash.events.Event;

	public class ArrayNavEvent extends Event
	{
		public static const CHANGE:String = "ArrayNavChange";
		
		private var _index:int;
		private var _content:Object;
		
		public function ArrayNavEvent(type:String, content:Object, index:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_index = index;
			_content = content;
			super(type, bubbles, cancelable);
		}
		
		public function get content() : Object
		{
			return _content;
		}
		
		public function get index() : int
		{
			return _index;
		}
		
		override public function clone() : Event
		{
			return new ArrayNavEvent( type, content, index, bubbles, cancelable );
		}
	}
}