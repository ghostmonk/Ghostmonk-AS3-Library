package com.ghostmonk.utils
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class TimedCallback
	{
		public static function create( call:Function, delay:Number, ...params ) : void
		{
			var timer:Timer = new Timer( delay, 1 );
			timer.start();
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, function( e:TimerEvent ) : void 
				{
					call.apply( null, params );
					e.currentTarget.removeEventListener( e.type, arguments.callee );
					timer.stop();
					timer = null;
				}
			);
		}
	}
}