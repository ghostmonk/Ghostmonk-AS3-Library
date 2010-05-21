package com.ghostmonk.ui.interactive.buttons.interfaces
{
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	
	public interface IInteractiveSprite extends IEventDispatcher
	{
		function get view() : Sprite 
		function enable():void
		function disable() : void 
	}
}