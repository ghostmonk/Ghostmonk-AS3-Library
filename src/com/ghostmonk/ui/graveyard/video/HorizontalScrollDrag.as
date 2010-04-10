package com.ghostmonk.ui.graveyard.video {
	
	import com.ghostmonk.events.PercentageEvent;
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	[Event(name="change", type="com.ghostmonk.events.PercentageEvent")]
	
	/**
	 *  
	 * @author ghostmonk 18/11/2008
	 * 
	 */
	public class HorizontalScrollDrag extends Sprite {
		
		
		
		internal var _scrollItem:MovieClip;
		internal var _scrollRect:Rectangle;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get scrollWidth():Number {
			
			return _scrollRect.width;
			
		}
		
		
		
		/**
		 * 
		 * @param scrollItem
		 * 
		 */
		public function HorizontalScrollDrag( scrollItem:MovieClip ) {
			
			_scrollItem = scrollItem;
			
			_scrollRect = new Rectangle( 0, 0, _scrollItem.width, _scrollItem.height );
			setScrollRect( 0 );
			
			_scrollItem.buttonMode = true;
			_scrollItem.mouseChildren = false;
			_scrollItem.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
		}
		
		
		
		/**
		 * 
		 * @param nWidth
		 * @param byPercent
		 * 
		 */
		public function setScrollRect( nWidth:Number, byPercent:Boolean = false ):void {
			
			_scrollRect.width = byPercent ? _scrollItem.width * nWidth : nWidth;
			var percent:Number = byPercent ? nWidth : nWidth / _scrollItem.width;
			_scrollItem.vol.scrollRect = _scrollRect;
			
			dispatchEvent( new PercentageEvent( PercentageEvent.CHANGE, percent ) );
			
		}
		
		
		
		private function onMouseDown(e:MouseEvent):void {
			
			onMouseMove( null );
			_scrollItem.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );	
			_scrollItem.stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
		
		private function onMouseUp( e:MouseEvent ):void {
			
			_scrollItem.stage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			_scrollItem.stage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
			
		}
		
		
		
		private function onMouseMove( e:MouseEvent ):void {
			
			setScrollRect( Math.min( _scrollItem.width, Math.max( 0,_scrollItem.mouseX ) ) );
			
		}
		
		
		
	}
}