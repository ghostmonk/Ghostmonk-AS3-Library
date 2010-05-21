package com.ghostmonk.ui.interactive.buttons 
{	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	/**
	 *	 
	 * @author ghostmonk
	 * 
	 */
	public class InteractiveSprite extends EventDispatcher
	{	
		private var _view:Sprite;
		private var _isEnabled:Boolean;
		
		private var _click:Function;
		private var _rollover:Function;
		private var _rollout:Function;
		
		public function InteractiveSprite( view:Sprite ) 
		{	
			_view = view;
			_view.mouseChildren = false;
			_click = onClick;
			_rollover = onRollover;
			_rollout = onRollout;
			enable();	
		}

		public function get view() : Sprite 
		{	
			return _view;	
		}
		
		public function setCallbacks( click:Function, rollover:Function = null, rollout:Function = null ) : void
		{
			disable();
			_click = click;
			if( rollover != null ) _rollover = rollover;
			if( rollout != null ) _rollout = rollout;
			if( _isEnabled ) enable();
		}
		
		public function enable():void 
		{
			_isEnabled = true;
			_view.buttonMode = true;
			_view.addEventListener( MouseEvent.ROLL_OVER, _rollover);
			_view.addEventListener( MouseEvent.ROLL_OUT, _rollout  );
			_view.addEventListener( MouseEvent.CLICK, _click );
		}

		public function disable() : void 
		{	
			_isEnabled = false;
			_view.buttonMode = false;
			_view.removeEventListener( MouseEvent.ROLL_OVER, _rollover );
			_view.removeEventListener( MouseEvent.ROLL_OUT, _rollout );
			_view.removeEventListener( MouseEvent.CLICK, _click);
		}
		
		protected function onRollover( e:MouseEvent = null ) : void {}
		
		protected function onRollout( e:MouseEvent = null ) : void {}
		
		protected function onClick( e:MouseEvent = null ) : void {}
	}
}