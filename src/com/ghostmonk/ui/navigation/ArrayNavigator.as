package com.ghostmonk.ui.navigation
{
	import com.ghostmonk.events.ArrayNavEvent;
	import com.ghostmonk.ui.graveyard.buttons.SimpleMovieClipButton;
	
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	[Event (name="change", type="com.ghostmonk.events.ArrayNavEvent")]
	
	public class ArrayNavigator extends EventDispatcher
	{
		private var _nextBtn:SimpleMovieClipButton;
		private var _previousBtn:SimpleMovieClipButton;
		private var _navSource:Array;
		private var _current:int;
		
		public function ArrayNavigator( next:MovieClip, previous:MovieClip )
		{
			_nextBtn = new SimpleMovieClipButton( next, onNext );		
			_previousBtn = new SimpleMovieClipButton( previous, onPrevious );
			previous.gotoAndStop( 0 );
		}
		
		public function set navSource( value:Array ) : void
		{
			_current = 0;
			_navSource = value;
			enable();
			deactivate( _previousBtn );
			activate( _nextBtn );
			if( _navSource.length == 1 ) deactivate( _nextBtn );
			dispatch();
		}
		
		public function enable() : void
		{
			_nextBtn.view.visible = _previousBtn.view.visible = true;
			_nextBtn.enable();
			_previousBtn.enable();
		}
		
		public function disable() : void
		{
			_navSource = null;
			_current = 0;
			_nextBtn.view.visible = _previousBtn.view.visible = false;
			_nextBtn.disable();
			_previousBtn.disable();
		}
		
		private function onNext( e:MouseEvent ) : void
		{
			if( _current == _navSource.length - 1 ) return;
			if( _current == 0 ) activate( _previousBtn );
			++_current;
			dispatch();
			if( _current == _navSource.length - 1 ) deactivate( _nextBtn );
		}
		
		private function onPrevious( e:MouseEvent ) : void
		{
			if( _current == 0 ) return;
			if( _current == _navSource.length - 1 ) activate( _nextBtn );
			--_current;
			dispatch();
			if( _current == 0 ) deactivate( _previousBtn );
		}
		
		private function deactivate( btn:SimpleMovieClipButton ) : void
		{
			btn.view.alpha = 0.2;
			btn.disable();
		}
		
		private function activate( btn:SimpleMovieClipButton ) : void
		{
			btn.view.alpha = 1;
			btn.enable();
		}
		
		private function dispatch() : void
		{
			dispatchEvent( new ArrayNavEvent( ArrayNavEvent.CHANGE, _navSource[ _current ], _current ) );
		}
	}
}