package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * @author ghostmonk
	 * 
	 */
	public class RoundedRectangle extends Sprite {
		
		
		
		/**
		 * 
		 * @param width
		 * @param height
		 * @param rad
		 * @param color
		 * @param alpha
		 * 
		 */
		public function RoundedRectangle( width:Number, height:Number, rad:Number, color:uint, alpha:Number ) {
			
			graphics.beginFill( color, alpha );
			graphics.drawRoundRect( 0, 0, width, height, rad, rad );
			graphics.endFill();
			scale9Grid = new Rectangle( rad / 4, rad / 4, width - 10, height - 10 );
			
		}
		
		
		
	}
}