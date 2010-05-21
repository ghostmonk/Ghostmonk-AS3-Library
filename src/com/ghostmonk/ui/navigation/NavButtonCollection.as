package com.ghostmonk.ui.navigation
{
	import com.ghostmonk.ui.interactive.buttons.interfaces.INavigationButton;
	import com.ghostmonk.utils.Iterator;
	
	public class NavButtonCollection
	{
		private var _buttons:Array;
		private var _iterator:Iterator;
		
		public function NavButtonCollection()
		{
			_buttons = [];
		}
		
		public function addButton( button:INavigationButton ) : void
		{
			_buttons.push( button );
		}
		
		public function getButtonByID( id:Number ) : INavigationButton
		{
			for each( var button:INavigationButton in _buttons )
				if( id == button.id ) return button;
			return null;
		}
		
		public function get iterator() : Iterator
		{
			if( _iterator == null ) _iterator = new Iterator( _buttons );
			return _iterator;
		}
	}
}