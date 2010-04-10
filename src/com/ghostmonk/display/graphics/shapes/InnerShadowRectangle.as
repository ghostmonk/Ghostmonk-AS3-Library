package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class InnerShadowRectangle extends Sprite {
		
		
		
		/**
		 * 
		 * @param color
		 * @param width
		 * @param height
		 * 
		 */
		public function InnerShadowRectangle( color:uint, width:Number, height:Number ) {
			
			graphics.beginFill( color );
			graphics.drawRect( 0, 0, width, height );
			graphics.endFill();
			
			filters = [ new DropShadowFilter( 0, 0, 0, 0.3, 20, 20, 2, 2, true ) ];
		}
		
		
		
	}
}