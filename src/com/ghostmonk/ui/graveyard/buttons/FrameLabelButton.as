package com.ghostmonk.ui.graveyard.buttons {
	
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	[Event(type="flash.events.MouseEvent", name="rollOver")]
	[Event(type="flash.events.MouseEvent", name="rollOut")]
	[Event(type="flash.events.MouseEvent", name="mouseDown")]
	[Event(type="flash.events.MouseEvent", name="mouseUp")]
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class FrameLabelButton extends EventDispatcher {
		
		
		
		private var _clip:MovieClip;
		private var _rollOver:int;
		private var _mouseDown:int;
		private var _clickCallback:Function;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get view():MovieClip {
			
			return _clip;
			
		}
		
		
		
		/**
		 * 
		 * @param callback
		 * 
		 */
		public function addClickCallback( callback:Function ):void {
			
			_clickCallback = callback;
			
		}
		
		
		
		/**
		 * 
		 * @param clip
		 * 
		 */
		public function FrameLabelButton( clip:MovieClip ) {
			
			_clip = clip;
			setFrameDestinations();
			enable();
			_clip.mouseChildren = false;
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			_clip.buttonMode = true;
			_clip.mouseEnabled = true;
			_clip.addEventListener( MouseEvent.ROLL_OVER, onRollover );
			_clip.addEventListener( MouseEvent.ROLL_OUT, onRollout );
			_clip.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			_clip.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			_clip.addEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable():void {
			
			_clip.buttonMode = false;
			_clip.mouseEnabled = false;
			_clip.removeEventListener( MouseEvent.ROLL_OVER, onRollover );
			_clip.removeEventListener( MouseEvent.ROLL_OUT, onRollout );
			_clip.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			_clip.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			_clip.addEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		private function setFrameDestinations():void {
			
			_clip.gotoAndStop( "rollOver" );
			_rollOver = _clip.currentFrame;
			_clip.gotoAndStop( "mouseDown" );
			_mouseDown = _clip.currentFrame;
			_clip.gotoAndStop( "rollOut" );
			
		}
		
		
		
		public function onRollover( e:MouseEvent ):void {
			 	
			tweenTo( _rollOver );
			dispatchEvent( e );
				
		}
		
		
		
		public function onRollout( e:MouseEvent ):void {
			 	
			tweenTo( 1 );
			dispatchEvent( e );
			 			
		}
		
		
		
		public function onMouseDown( e:MouseEvent ):void {
			 	
			tweenTo( _mouseDown );
			dispatchEvent( e );
				
		}
		
		
		
		public function onMouseUp( e:MouseEvent ):void {
			 	
			tweenTo( _rollOver );
			dispatchEvent( e );
				
		}
		
		
		
		private function tweenTo( destFrame:int ):void {
			
			Tweener.removeTweens( _clip );
			var framerate:Number = _clip.stage ? _clip.stage.frameRate : 31;
			var transTime:Number = Math.abs( ( destFrame - _clip.currentFrame ) ) / framerate;
			Tweener.addTween( _clip, { _frame:destFrame, time:transTime, transition:Equations.easeNone } );
			
		}
		
		
		
		private function onMouseClick( e:MouseEvent ):void {
			
			if( _clickCallback != null ) {
				_clickCallback( e );
			}
			
		}
		
		
		
	}
}