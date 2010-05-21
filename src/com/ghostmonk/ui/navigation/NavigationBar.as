package com.ghostmonk.ui.navigation
{
	import com.ghostmonk.events.IDEvent;
	import com.ghostmonk.ui.interactive.buttons.NavigationButton;
	import com.ghostmonk.ui.interactive.buttons.interfaces.INavigationButton;
	
	import flash.display.Sprite;

	public class NavigationBar extends Sprite
	{
		private var _collection:NavButtonCollection;
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
		
		public function get collection() : NavButtonCollection 
		{
			return _collection;
		}
		
		public function selectItem( id:Number ) : void
		{
			var target:INavigationButton = _collection.getButtonByID( id );
			_collection.iterator.apply(
				function( btn:INavigationButton ) : void 
				{ 
					if( btn != target ) btn.deactivate();
				} 
			);
			target.activate();
		}
		
		public function init( btns:NavButtonCollection ) : void
		{
			_collection = btns;
			
			_collection.iterator.apply(
				function( btn:INavigationButton ) : void { btn.addEventListener( IDEvent.UPDATE, onNavigation ) } 
			);
			
			reposition();
		}
		
		public function enable() : void
		{
			_collection.iterator.apply( 
				function( btn:INavigationButton ) : void { btn.enable(); } 
			);
		}
		
		public function disable() : void
		{
			_collection.iterator.apply( 
				function( btn:INavigationButton ) : void { btn.disable(); } 
			);
		}
		
		private function reposition() : void
		{
			if( !_collection ) return;
			var position:Number = 0;
			
			_collection.iterator.apply( 
				function( btn:INavigationButton ) : void
				{
					if( _isVertical ) btn.view.y = position;
					else btn.view.x = position;
					
					position += _isVertical ? btn.view.height : btn.view.width;
					position += _padding;
					addChild( btn.view );
				}
			);
		}
		
		private function onNavigation( e:IDEvent ) : void
		{
			dispatchEvent( e );
		}
	}
}