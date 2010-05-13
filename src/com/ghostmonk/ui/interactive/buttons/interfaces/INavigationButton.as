package com.ghostmonk.ui.interactive.buttons.interfaces
{
	public interface INavigationButton extends IInteractiveSprite
	{
		function set id( value:Number ) : void;
		function get id() : Number;
		function set text( value:String ) : void;
		function activate() : void;
		function deactivate() : void;
	}
}