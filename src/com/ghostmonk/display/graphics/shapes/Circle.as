package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class Circle extends Sprite {
		
		private var _color:int;
		private var _radius:Number;
		
		
		/**
		 * 
		 * @param color
		 * @param radius
		 * 
		 */
		public function Circle( color:int, radius:Number ) {
			
			_color = color;
			_radius = radius;
			redraw();
				
		}
		
		
		
		/**
		 * 
		 * @param color
		 * 
		 */
		public function setColor( color:int ) : void {
			
			_color = color;
			redraw();
				
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function redraw() : void {
			
			graphics.clear();
			graphics.beginFill( _color, 1 );
			graphics.drawCircle( -_radius, -_radius, _radius );
			graphics.endFill();
				
		}
	}
}