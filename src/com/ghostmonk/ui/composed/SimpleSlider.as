package com.ghostmonk.ui.composed {
	
	import com.ghostmonk.events.MeasureEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	[Event ( name="valueChange", type="com.ghostmonk.events.MeasureEvent" ) ]
	
	/**
	 * A slider control that dispatches a MeasureEvent between a minimum and maximum number
	 * <p>This class expects three objects</p>
	 * <ul>
	 * 		<il>A container that house the following two sprites</li>
	 * 		<il>A marker sprite to give visual feedback</li>
	 * 		<li>An invisible background to act as a hitarea and maximum value width</li>
	 * </ul>
	 * 
	 * @author ghostmonk 14/04/2009
	 * 
	 */
	public class SimpleSlider extends DraggableInteractiveSprite {
		
		
		private var _hitarea:DisplayObject;
		private var _marker:DisplayObject;
		
		private var _minimumValue:Number;
		private var _maximumValue:Number;
		private var _currentValue:Number;
		private var _range:Number;
		
		
		
		/**
		 * The lowest possible return value
		 *  
		 *  
		 * @param value
		 * 
		 */
		public function set minValue( value:Number ):void {
			
			_minimumValue = value;
			
		}
		
		
		
		public function get minValue():Number {
			
			return _minimumValue;
			
		}
		
		
		
		/**
		 * The greatest possible return value
		 *  
		 * @param value
		 * 
		 */
		public function set maxValue( value:Number ):void {
			
			_maximumValue = value;
			
		}
		
		
		
		public function get maxValue():Number {
			
			return _maximumValue;
			
		}
		
		
		
		/**
		 * Marker width is set when this value is set, 
		 *  
		 * @param value should be between minValue and maxValue but will be force to closest value if not
		 * 
		 */
		public function set currentValue( value:Number ):void {
			
			_currentValue = Math.min( _maximumValue, Math.max( _minimumValue, value ) );
			setDisplay();
			
		}
		
		
		
		public function get currentValue():Number {
			
			return _currentValue;
			
		}
		
		
		
		/**
		 * 
		 * The correct way to instantiate this object is by passing in an instance of a sprite that is composed of two other
		 * sprites representing hitarea and marker.
		 * <p>Marker is the feedback display representing the current level of the instance, and hitarea is typically
		 * an invisible version of marker identical in width and height of the marker when at full level. The width of marker is 
		 * altered on interaction, however the width of hitarea is never altered, and this value is used in calculation to return 
		 * the currentValue of the object.</p>
		 * <p>currentValue is by default set to minValue in the constructor, and should be set after instantiation if another start 
		 * value is desired.</p> 
		 * 
		 * @param holder a composed sprite that contains hitarea and marker. Is accessible through the get view() method
		 * @param hitarea should be layered in the background, and have a visual distintion from marker, which is evaluated 
		 * 	and displayed against it
		 * @param marker feedback for current value
		 * @param minVal the lowest possible value dispatched from this class 
		 * @param maxVal the highest possible value dispatched form this class
		 * 
		 */
		public function SimpleSlider( view:Sprite, hitarea:DisplayObject, marker:DisplayObject, minVal:Number = 0, maxVal:Number = 100 ) {
			
			super( view, onMouseMove );
			
			_hitarea = hitarea;
			_marker = marker;
			
			_minimumValue = _currentValue = minVal;
			_maximumValue = maxVal;
			_range = _maximumValue - _minimumValue;
			
			setDisplay();
			
			
		}

		

		private function onMouseMove( e:MouseEvent ):void {
			
			updateCurrentValue();
			dispatchEvent( new MeasureEvent( MeasureEvent.VALUE_CHANGE, _currentValue ) );
			
		}



		private function updateCurrentValue():void {
			
			var min:Number = _marker.x;
			var max:Number = min + _hitarea.width;
			var markerWidth:Number = Math.max( min, Math.min( max, view.mouseX ) ) - min;
			var percent:Number = 1 - ( _hitarea.width - markerWidth ) / _hitarea.width;
			_currentValue = Math.max( _range * percent + _minimumValue, _minimumValue );
			setDisplay();
			
		}
		
		
		
		private function setDisplay():void {
			
			var nominator:Number = _currentValue - _minimumValue;
			var percent:Number = nominator / _range;
			_marker.width = _hitarea.width * percent;
			
		}
		
		
		
	}
}