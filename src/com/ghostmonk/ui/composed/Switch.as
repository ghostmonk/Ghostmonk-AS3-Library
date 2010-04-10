package com.ghostmonk.ui.composed {
	
	import com.ghostmonk.events.ToggleEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	[Event ( name="toggle", type="com.ghostmonk.events.ToggleEvent" ) ]
	
	public class Switch extends InteractiveSprite {
		
		private var _marker:DisplayObject;
		
		private var _offPosition:Point;
		private var _onPosition:Point;
		
		private var _isOn:Boolean;
		
		
		public function Switch( view:Sprite, marker:DisplayObject, isOn:Boolean = false ) {
		
			super( view );
			
			_marker = marker;
			
			_isOn = false;
			
			_offPosition = new Point( _marker.x, _marker.y );
			
			var yOnPosition:Number = view.height - ( _marker.y + _marker.height );
			var xOnPosition:Number = view.width - _marker.width - _marker.x;
			
			_onPosition = new Point( xOnPosition, yOnPosition );
			
			_isOn = isOn;
			
			positionMarker();
			
		}
		
		
		
		override public function enable():void {
			
			super.enable();
			view.addEventListener( MouseEvent.CLICK, onClick );
			
		}
		
		
		
		override public function disable():void {
			
			super.disable();
			view.removeEventListener( MouseEvent.CLICK, onClick );
			
		}
		
		
		
		private function onClick( e:MouseEvent ):void {
			
			_isOn = !_isOn;
			
			positionMarker();
			
			dispatchEvent( new ToggleEvent( ToggleEvent.TOGGLE, _isOn ) );
			
		}
		
		private function positionMarker():void {
			
			_marker.x = _isOn ? _onPosition.x : _offPosition.y;
			_marker.y = _isOn ? _onPosition.y : _offPosition.y;
				
		}

	}
}