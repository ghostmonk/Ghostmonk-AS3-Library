package com.ghostmonk.ui.interactive {
	
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.ui.interactive.buttons.ClickableSprite;
	import com.ghostmonk.ui.interactive.buttons.InteractiveSprite;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	[Event ( name="valueChange", type="com.ghostmonk.events.MeasureEvent" ) ]
	
	/**
	 * 
	 * @author ghostmonk 19/04/2009
	 * 
	 */
	public class SimpleStepper extends InteractiveSprite {
		
		
		
		private var _view:Sprite;
		private var _up:ClickableSprite;
		private var _down:ClickableSprite;
		private var _text:TextField;
		private var _max:Number;
		private var _min:Number;
		private var _currentValue:Number;
		private var _increment:Number;
		
		
		
		/**
		 * 
		 * @param view
		 * @param up
		 * @param down
		 * @param text
		 * @param max
		 * @param min
		 * @param start
		 * @param increment
		 * 
		 */
		public function SimpleStepper(
			view:Sprite, 
			up:Sprite, 
			down:Sprite, 
			text:TextField, 
			max:Number = 99, 
			min:Number = 1, 
			start:Number = 1, 
			increment:Number = 1 ) {
			
			super( view );
			view.mouseChildren = true;
			
			_view = view;
			_up = new ClickableSprite( up, onIncrement );
			_down = new ClickableSprite( down, onDecrement );
			_text = text;
			_max = max;
			_min = min;
			_currentValue = start;
			renderDisplay();
			_increment = increment;
			
		}
		
		
		
		private function onIncrement( e:MouseEvent ):void {
			
			_currentValue += _increment;
			renderDisplay();
			
		}
		
		
		
		private function onDecrement( e:MouseEvent ):void {
			
			_currentValue -= _increment;
			renderDisplay();
			
			
		}
		
		
		
		private function renderDisplay():void {
			
			_currentValue = Math.min( _max, Math.max( _min, _currentValue ) );
			_text.text = _currentValue.toString();
			dispatchEvent( new MeasureEvent( MeasureEvent.VALUE_CHANGE, _currentValue ) );
			
		}



	}
}