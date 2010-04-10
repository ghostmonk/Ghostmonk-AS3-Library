package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.Sprite;

	/**
	 * @author ghostmonk
	 * 
	 */
	public class Polygon extends Sprite {
		
		
		
		public function Polygon( sides:int, radius:Number, color:Number ) {
			
			var radius:Number = width * 0.5;
			var rad:Number = ( 360 / sides ) * Math.PI / 180;
			
			graphics.beginFill( color, alpha );
					 
			for( var i:int = 1; i <= sides; i++ ) {
		
				if(i == 1) {
					graphics.moveTo( Math.cos( rad * i )*radius,Math.sin( rad * i )*radius );
				}
				else {
					graphics.lineTo( Math.cos( rad * i )*radius,Math.sin( rad * i ) * radius );
				}
	
			}
			
			graphics.endFill();
				
		}
		
		
		
	}
}