package com.ghostmonk.ui.interactive.buttons
{
	import com.ghostmonk.events.IDEvent;
	import com.ghostmonk.ui.interactive.buttons.interfaces.INavigationButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class NavigationButton extends InteractiveSprite implements INavigationButton
	{
		private var _id:Number;
		private var _eventType:String;
		
		public function NavigationButton( view:Sprite )
		{
			super( view );
			mouseClickFunc = onClick;
		}
		
		public function set id( value:Number ) : void 
		{
			_id = value;
		}
		
		public function get id() : Number
		{
			return _id;
		}
		
		public function activate() : void {}
		
		public function deactivate() : void {}
		
		public function set text( value:String ) : void {}
		
		private function onClick( e:MouseEvent ) : void
		{
			dispatchEvent( new IDEvent( IDEvent.UPDATE, _id ) );
		}
	}
}