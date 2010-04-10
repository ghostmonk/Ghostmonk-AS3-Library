package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;
	import flash.filters.BlurFilter;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class BlurredRectangle extends Sprite {
		
		
		
		/**
		 * 
		 * @param color
		 * @param width
		 * @param height
		 * 
		 */
		public function BlurredRectangle( color:uint, width:int, height:int ) {
			
			graphics.beginFill( color );
			graphics.drawRect( 0, 0, width, height );
			graphics.endFill();
			filters = [ new BlurFilter() ];
			
		}
		
		
		
	}
}