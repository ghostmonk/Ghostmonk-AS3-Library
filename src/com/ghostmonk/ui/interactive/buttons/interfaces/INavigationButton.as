package com.ghostmonk.ui.interactive.buttons.interfaces
{
	public interface INavigationButton extends IInteractiveSprite
	{
		function set text( value:String ) : void;
		function set id( value:Number ) : void;
		function set eventType( value:String ) : void;
	}
}