package com.ghostmonk.display.graphics.shapes 
{	
	import flash.display.Sprite;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class Circle extends Sprite 
	{	
		private var _color:int;
		private var _radius:Number;
		private var _isCenterRegistered:Boolean;
		
		public function Circle( color:int, radius:Number, centerRegistration:Boolean = true ) 
		{	
			_color = color;
			_radius = radius;
			redraw();
			_isCenterRegistered = centerRegistration;		
		}
		
		public function set centerRegistration( value:Boolean ) : void
		{
			_isCenterRegistered = value;
			redraw();
		}
		
		public function setColor( color:int ) : void 
		{	
			_color = color;
			redraw();		
		}
		
		public function redraw() : void 
		{	
			var start:Number = _isCenterRegistered ? -_radius : 0;
			
			graphics.clear();
			graphics.beginFill( _color, 1 );
			graphics.drawCircle( start, start, _radius );
			graphics.endFill();
				
		}
	}
}