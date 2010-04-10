package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class SimpleRectangle extends Sprite {
		
		
		
		/**
		 * 
		 * @param color
		 * @param width
		 * @param height
		 * 
		 */
		public function SimpleRectangle( color:uint, width:Number, height:Number ) {
			
			graphics.beginFill( color );
			graphics.drawRect( 0, 0, width, height );
			graphics.endFill();
			
		}
		
		
		
	}
}