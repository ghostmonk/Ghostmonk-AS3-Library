package com.ghostmonk.ui.navigation
{
	import com.ghostmonk.events.IDEvent;
	import com.ghostmonk.ui.interactive.buttons.NavigationButton;
	import com.ghostmonk.ui.interactive.buttons.interfaces.INavigationButton;
	
	import flash.display.Sprite;

	public class NavigationBar extends Sprite
	{
		private var _eventType:String;
		private var _buttons:Array;
		private var _buttonType:Class = NavigationButton;
		private var _padding:Number = 10;
		private var _isVertical:Boolean = false;
		
		public function set isVertical( value:Boolean ) : void
		{
			_isVertical = value;
			reposition();
		}
		
		public function set padding( value:Number ) : void
		{
			_padding = value;
			reposition();
		}
		
		public function set buttonType( type:Class ) : void
		{
			if( new type() is INavigationButton )
			{
				_buttonType = type;
				return;
			}
			throw new Error( new TypeError( type.toString(), "is not a valid button type. Please use a derviative ofNavigationButton" ) );
		} 
		
		public function createBar( ids:Array, eventType:String ) : void
		{
			_buttons = _buttons ? _buttons : new Array();
			_eventType = eventType;
			
			for( var i:int = 0; i < ids.length; i++ )
			{
				var button:INavigationButton = new _buttonType();
				button.text = ids[ i ];
				button.addEventListener( IDEvent.UPDATE, onNavigation );
				_buttons.push( button );
			}
			
			reposition();
		}
		
		public function enable() : void
		{
			for each( var btn:INavigationButton in _buttons ) btn.enable();
		}
		
		public function disable() : void
		{
			for each( var btn:INavigationButton in _buttons ) btn.disable();
		}
		
		private function reposition() : void
		{
			var position:Number = 0;
			
			for each( var btn:INavigationButton in _buttons )
			{
				if( _isVertical )
				{
					btn.view.y = position;
					position += btn.view.height + _padding;
				}
				else
				{
					btn.view.x = position;
					position += btn.view.width + _padding;
				}
			}
		}
		
		private function onNavigation( e:IDEvent ) : void
		{
			//dispatchEvent( new NavigationEvent( _eventType, e.id ) );
		}
	}
}