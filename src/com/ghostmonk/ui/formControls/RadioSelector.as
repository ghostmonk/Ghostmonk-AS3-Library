package com.ghostmonk.ui.formControls {
	
	import com.ghostmonk.events.RadioSelectionEvent;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	[Event(name="radioSelection", type="com.ghostmonk.events.RadioSelectionEvent")]
	
	/**
	 * Simple radio button with expected and basic functionality
	 * 
	 * @author ghostmonk - 24/06/2009
	 * 
	 */
	public class RadioSelector extends Sprite {
		
		
		private var _bgColor:uint;
		private var _selectedColor:uint;
		private var _radius:Number;
		private var _borderColor:uint;
		private var _borderSize:Number;
		private var _selectedRatio:Number;
		
		private var _isChecked:Boolean;
		private var _id:int;
		
		
		
		/**
		 * Force the radio button to be selected or not
		 *  
		 * @param value
		 * 
		 */
		public function set isChecked( value:Boolean ):void {
			
			_isChecked = false;
			draw( _isChecked );
			
		}
		
		
		
		public function get id():int {
			
			return _id;
			
		}
		
		
		/**
		 * The default ration is optimized for 0.6. This sets the size of the inscribed 
		 * selection indicator in the center of the circle. If this is not appropriate for the circle
		 * it can be reset using this setter.
		 * 
		 * @param value - ratio of the inscribed selection circle *default set in the constructor is 0.6
		 * 
		 */
		public function set selectedRatio( value:Number ):void {
			
			_selectedRatio = Math.max( 0, Math.min( 0.99, value ) );
			draw( _isChecked );
			
		}
		
		
		/**
		 * 
		 * @param value - color of the background of the radio selector *default set in the constructor is 0xFFFFFF
		 * 
		 */
		public function set bgColor( value:uint ):void {
			
			_bgColor = value;
			draw( _isChecked );
			
		}
		
		/**
		 * 
		 * @param value - color of the inscribed selected circle *default set in the constructor is 0x686868
		 * 
		 */
		public function set selectedColor( value:uint ):void {
			
			_selectedColor = value;
			draw( _isChecked );
			
		}
		
		/**
		 * 
		 * @param value - radius of the entire radio button *default set in the constructor is 7.5
		 * 
		 */
		public function set radius( value:Number ):void {
			
			_radius = value;
			draw( _isChecked );
			
		}
		
		
		/**
		 * 
		 * @param value - Color of the border around the radio button *default set in the constructor is 0x686868
		 * 
		 */
		public function set borderColor( value:uint ):void {
			
			_borderColor = value;
			draw( _isChecked );
			
		}
		
		
		/**
		 * 
		 * @param value - width of the border around the radio button *default set in the constructor is 1
		 * 
		 */
		public function set borderSize( value:Number ):void {
			
			_borderSize = value;
			draw( _isChecked );
			
		}
		
		
		/**
		 * 
		 * @param id reference to the radio selector
		 * @param radius radius of the radio button
		 * 
		 */
		public function RadioSelector( id:int, radius:Number ) {
			
			_id = id;
			_radius = radius;
			
			_bgColor = 0xFFFFFF; 
			_selectedColor = _borderColor = 0x686868; 
			_borderSize = 1;
			_selectedRatio = 0.6; 
			
			enable();
			
		}
		
		
		
		/**
		 * Enable mouse interactivity
		 * 
		 */
		public function enable():void {
			
			_isChecked = false;
			draw( _isChecked );
			buttonMode = true;
			addEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		/**
		 * Remove mouse interactivity 
		 * 
		 */
		public function disable():void {
			
			buttonMode = false;
			removeEventListener( MouseEvent.CLICK, onMouseClick );
			
		}
		
		
		
		private function onMouseClick( e:MouseEvent ):void {
			
			_isChecked = !_isChecked;
			draw( _isChecked );
			
			dispatchEvent( new RadioSelectionEvent( RadioSelectionEvent.RADIO_SELECTION, _isChecked, _id ) );
			
		}
		
		
		
		private function draw( selected:Boolean ):void {
			
			graphics.clear();
			graphics.lineStyle( _borderSize, _borderColor );
			graphics.beginFill( _bgColor );
			graphics.drawCircle( 0, 0, _radius );
			
			if( selected ) {
				graphics.beginFill( _selectedColor );
				graphics.drawCircle( 0, 0, _radius * _selectedRatio );
			}
			
			graphics.endFill();
			
		}
		
		

	}
}