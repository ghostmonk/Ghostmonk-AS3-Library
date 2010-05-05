package com.ghostmonk.ui.interactive {	

	import com.ghostmonk.events.PointValueEvent;
	import com.ghostmonk.ui.interactive.buttons.DraggableInteractiveSprite;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	[Event ( name="pointPercent", type="com.ghostmonk.events.PointValueEvent" ) ]

	/**
	 * Two-dimensional click and draggable plane that returns horizontal and vertical values by decimal percent.
	 *  
	 * @author ghostmonk
	 * 
	 */
	public class TwoDimensionalGridControl extends DraggableInteractiveSprite {
		
		
		
		private var _marker:DisplayObject;
		private var _offset:Number;
		private var _xMax:Number;
		private var _yMax:Number;
		
		
		/**
		 * 
		 * @param view composed sprite with a marker
		 * @param marker the center point of the marker is meant to be a circle and should be registered at zero zero
		 * @param xValue the starting x decimal percent of the marker
		 * @param yValue the starting y decimal percent of the marker
		 * 
		 */
		public function TwoDimensionalGridControl( view:Sprite, marker:DisplayObject, xDecimal:Number = 0, yDecimal:Number = 0 ) {
			
			super( view, onMouseMove );
			
			_offset = marker.width / 2;
			_xMax = view.width - _offset;
			_yMax = view.height - _offset;
			
			_marker = marker;
			
			setMarker( _xMax * xDecimal, _yMax - _yMax * yDecimal );
		}
		
		private function setMarker( xPos:Number, yPos:Number ):void {
			
			_marker.x = Math.max( _offset, Math.min( _xMax, xPos ) );
			_marker.y = Math.max( _offset, Math.min( _yMax, yPos ) );
			
			//some tricky math... when worked out on paper, it is obvious that both the marker position 
			//and max positions need to be offset
			var xDecimal:Number = ( _marker.x - _offset ) / ( _xMax - _offset );
			var yDecimal:Number = ( _marker.y - _offset ) / ( _yMax - _offset ); 
			
			yDecimal = 1 - yDecimal;
			
			dispatchEvent( new PointValueEvent( PointValueEvent.POINT_PERCENT, new Point( xDecimal, yDecimal ) ) );
			
			
		}
		
		private function onMouseMove( e:MouseEvent ):void {
			
			setMarker( view.mouseX, view.mouseY );
			
		}
		
		
	}
}