package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class Arrow extends Sprite {
		
		/**
		 * 
		 * @param length
		 * @param color
		 * 
		 */
		public function Arrow( length:Number, color:Number ) {
			
			graphics.beginFill( color );
			graphics.moveTo( -length / 2, -length / 10 );
			graphics.lineTo( 2 * ( length / 10 ), -length / 10 );
			graphics.lineTo( 2 * ( length / 10 ), -length / 5 );
			graphics.lineTo( length / 2, 0);
			graphics.lineTo( 2 * ( length / 10 ), length / 5 );
			graphics.lineTo( 2 * ( length / 10 ), length / 10 );
			graphics.lineTo( -length / 2, length / 10 );
			graphics.endFill();
			
		}
		
	}
}