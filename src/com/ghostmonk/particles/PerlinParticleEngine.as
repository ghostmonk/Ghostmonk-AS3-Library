package com.ghostmonk.particles {
	
	import com.ghostmonk.display.bitmap.perlin.PerlinBitmapData;
	
	import flash.geom.Point;
	
	public class PerlinParticleEngine {
		
		
		
		private var _data:PerlinBitmapData;
		
		
		
		public function PerlinParticleEngine( width:Number, height:Number ) {
			
			_data = new PerlinBitmapData( width, height );
			
		}
		
		
		
		public function get perlinData() : PerlinBitmapData {
			
			return _data;
			
		}
		
		
		
		public function calculatePointMagnitude( x:Number, y:Number ) : Point {
			
			var rads:Number = _data.getPixel( x, y ) /  16711422 * 255;
			return new Point( Math.cos( rads ), Math.sin( rads ) );
			
		}
		
		
		

	}
}