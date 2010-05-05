package com.ghostmonk.ui.interactive.buttons 
{	
	import com.ghostmonk.ui.interactive.buttons.interfaces.IInteractiveSprite;
	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	public class InteractiveSprite extends EventDispatcher implements IInteractiveSprite
	{	
		private var _view:Sprite;
		private var _mouseOutFunc:Function;
		private var _mouseOverFunc:Function;
		private var _mouseClickFunc:Function;
		
		/**
		 * 
		 * @param view
		 * @param mouseChildren
		 * 
		 */
		public function InteractiveSprite( view:Sprite ) 
		{	
			_view = view;
			_view.mouseChildren = false;
			enable();	
		}
		
		/**
		 * Use this to access the entire visual object 
		 * 
		 * @return 
		 * 
		 */
		public function get view() : Sprite 
		{	
			return _view;	
		}
		
		/**
		 * By default this callback is set to null in the constructor and ignored on mouseOver.
		 * Use this modifier to set the callback and it will be called on mouseOver.
		 * 
		 * @param callback function to call on mouseOver. A clone of MouseEvent is passed as a parameter when called. 
		 * 
		 */
		public function set rollOverFunc( callback:Function ) : void 
		{	
			_mouseOverFunc = callback;		
		}
		
		/**
		 * By default this callback is set to null in the constructor and ignored on mouseOut.
		 * Use this modifier to set the callback and it will be called on mouseOut.
		 * 
		 * @param callback function to call on mouseOut. A clone of MouseEvent is passed as a parameter when called. 
		 * 
		 */
		public function set rollOutFunc( callback:Function ) : void 
		{	
			_mouseOutFunc = callback;	
		}
		
		/**
		 * By default this callback is set to null in the constructor and ignored on mouseOut.
		 * Use this modifier to set the callback and it will be called on the Click MouseEvent.
		 * 
		 * @param callback function to call on click. A clone of MouseEvent is passed as a parameter when called. 
		 * 
		 */
		public function set mouseClickFunc( callback:Function ) : void 
		{	
			_mouseClickFunc = callback;		
		}
		
		public function enable():void 
		{
			_view.buttonMode = true;
			_view.addEventListener( MouseEvent.ROLL_OVER, onMouseOver );
			_view.addEventListener( MouseEvent.ROLL_OUT, onMouseOut );
			_view.addEventListener( MouseEvent.CLICK, onMouseClick );
		}

		public function disable() : void 
		{	
			_view.buttonMode = false;
			_view.removeEventListener( MouseEvent.ROLL_OVER, onMouseOver );
			_view.removeEventListener( MouseEvent.ROLL_OUT, onMouseOut );
			_view.removeEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		private function onMouseOver( e:MouseEvent ) : void 
		{	
			if( _mouseOverFunc != null ) 
			{
				_mouseOverFunc( e );
			}	
		}
		
		private function onMouseOut( e:MouseEvent ) : void 
		{	
			if( _mouseOutFunc != null ) 
			{
				_mouseOutFunc( e );
			}	
		}
		
		private function onMouseClick( e:MouseEvent ) : void 
		{	
			if( _mouseClickFunc != null ) 
			{
				_mouseClickFunc( e );
			}
		}
	}
}