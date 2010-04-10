package com.ghostmonk.utils
{
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	/**
	 * @author ghostmonk
	 * 
	 */
	public class BaseContextMenu {
		
		
		
		private var _contextMenu:ContextMenu;
		private var _links:Object;
		private var _target:Sprite;
		
		
		
		/**
		 * Clears built-in items
		 * @param app - the object where you want to add the contextMenu
		 * 
		 */
		public function BaseContextMenu( target:Sprite ) {
			
			_links = [];
			_contextMenu = new ContextMenu();
			_contextMenu.hideBuiltInItems();
			_target = target;
			
		}
		
		
		
		/**
		 * Add a link and label to the contextual Menu
		 * 
		 * @param label
		 * @param url
		 * 
		 */
		public function addLink( label:String, url:String ):void {
			
			var link:ContextMenuItem = new ContextMenuItem( label );
			link.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, onSelect );
			
			_contextMenu.customItems.push( link );
			_links[ label ] = url;
			
			_target.contextMenu = _contextMenu;
	
		}
		
		
		
		private function onSelect( e:ContextMenuEvent ):void {
			
			navigateToURL( new URLRequest( _links[ ContextMenuItem( e.target ).caption ] ), "_blank" );
			
		}
		
		
		
	}
}