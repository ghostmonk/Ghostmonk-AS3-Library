package com.ghostmonk.ui.graveyard.idecomposed {
	
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class Switch {
		
		
		
		private var _view:MovieClip;
		private var _flip:Sprite;
		private var _isOn:Boolean;
		private var _callback:Function;
		
		
		
		/**
		 * 
		 * @param view
		 * @param callBack
		 * 
		 */
		public function Switch( view:MovieClip, callBack:Function ) {
			
			_view = view;
			_flip = _view.flip;
			_isOn = true;
			_callback = callBack; 
			_view.mouseChildren = false;
			onMouseClick();
			enable();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_view.buttonMode = true;
			_view.addEventListener( MouseEvent.CLICK, onMouseClick )
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_view.buttonMode = false;
			_view.removeEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		/**
		 * _isOn is flipped in onMouseClick, so first set it to the preferred off state, it will be flipped back in onMouseClick
		 * @param turnOff
		 * 
		 */
		public function setState( turnOff:Boolean ):void {
			
			_isOn = turnOff;
			onMouseClick();
			
		}
		
		
		
		private function onMouseClick( e:MouseEvent = null ):void {
			
			_isOn = !_isOn;
			
			if( _isOn ) {
				_callback( this );
			}
			 
			var yPos:Number = _isOn ? 1.6 : 22.6; 
			
			Tweener.removeTweens( _flip );
			Tweener.addTween( _flip, { y:yPos, time:0.1, transition:Equations.easeNone } );
			
		} 
		
		
		
	}
}