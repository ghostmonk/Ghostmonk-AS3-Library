package com.ghostmonk.ui.interactive.buttons
{
	import com.ghostmonk.events.NavigationEvent;
	import com.ghostmonk.ui.interactive.buttons.interfaces.INavigationButton;
	
	import flash.display.Sprite;

	public class NavigationButton extends InteractiveSprite implements INavigationButton
	{
		private var _id:Number;
		private var _eventType:String;
		
		public function NavigationButton( view:Sprite )
		{
			super( view );
			mouseClickFunc = onClick;
		}
		
		public function set text( value:String ) : void {}
		
		public function set id( value:Number ) : void 
		{
			_id = value;
		}
		
		public function set eventType( value:String ) : void 
		{	
			_eventType = value;	
		}
		
		private function onClick() : void
		{
			dispatchEvent( new NavigationEvent( _eventType, _id ) );
		}
	}
}