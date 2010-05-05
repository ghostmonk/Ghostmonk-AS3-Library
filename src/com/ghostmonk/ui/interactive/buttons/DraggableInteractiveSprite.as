package com.ghostmonk.ui.interactive.buttons {
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * Adds click and drag behaviour to the InteractiveSprite
	 *  
	 * @author ghostmonk
	 * 
	 */
	public class DraggableInteractiveSprite extends InteractiveSprite {
		
		private var _onMouseMove:Function;
		
		/**
		 * Sets up interactive behaviour, mouseOver / mouseOut / mouseDown / mouseMove
		 *  
		 * @param view composed sprite, usually with some sort of marker
		 * @param onMouseMove the function to be called when the mouse is clicked and then moved,
		 * a clone of the MouseEvent is passed as a parameter 
		 * 
		 */
		public function DraggableInteractiveSprite( view:Sprite, onMouseMove:Function ) {
			
			super( view );
			
			_onMouseMove = onMouseMove;
			
		}
		
		
		/**
		 * Maintains functionality of SuperClass, adds mousedown listener
		 * 
		 */
		override public function enable():void {
			
			super.enable();
			view.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
		}
		
		
		
		/**
		 * Maintains functionality of SuperClass, removes mousedown listener
		 * 
		 */
		override public function disable():void {
			
			super.disable();
			view.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
		}
		
		
		
		private function onMouseDown( e:MouseEvent ):void {
			
			view.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			view.stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			_onMouseMove( e );
			
		}
		
		
		
		private function onMouseMove( e:MouseEvent ):void {
			
			_onMouseMove( e );
			
		}
		
		
		
		private function onMouseUp( e:MouseEvent ):void {
			
			view.stage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			view.stage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
	}
}