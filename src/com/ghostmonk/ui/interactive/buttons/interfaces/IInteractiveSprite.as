package com.ghostmonk.ui.interactive.buttons.interfaces
{
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	
	public interface IInteractiveSprite extends IEventDispatcher
	{
		function get view() : Sprite 
		function set rollOverFunc( callback:Function ) : void 
		function set rollOutFunc( callback:Function ) : void 
		function set mouseClickFunc( callback:Function ) : void 
		function enable():void
		function disable() : void 
	}
}