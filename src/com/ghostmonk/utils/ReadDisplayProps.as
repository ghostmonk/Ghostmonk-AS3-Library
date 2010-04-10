package com.ghostmonk.utils {
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	
	/**
	 * Various functions to ascertain properties of display objects
	 * 
	 * @author ghostmonk 06/06/2009
	 * 
	 */
	public class ReadDisplayProps {
		
		
		/**
		 * Returns the first available opaque top-left pixel color of a display object.
		 * 
		 * @param item
		 * @return 
		 * 
		 */
		public static function getObjectColor( item:DisplayObject ):uint {
			
			var temp:BitmapData = new BitmapData( item.width, item.height, true, 0 );
			
			temp.draw( item );
			
			var point:Point = getFirstOpaquePixel( temp );
			
			return temp.getPixel( point.x, point.y );
			
		}
		
		
		
		/**
		 * Originally written by Mario Klingemann
		 * Returns the point location of the first available opaque pixel from supplied bitmapData
		 *  
		 * @param bmd
		 * @return 
		 * 
		 */
		public static function getFirstOpaquePixel( bmd:BitmapData ):Point {
			
			var hitRec:Rectangle = new Rectangle( 0, 0, bmd.width, 1 );
			
			var point:Point = new Point();
			
			for( hitRec.y = 0; hitRec.y < bmd.height; hitRec.y++ ) {
				
				if( bmd.hitTest( point, 0x01, hitRec ) ) {
					var hitBmd:BitmapData = new BitmapData( bmd.width, 1, true, 0 );
					hitBmd.copyPixels( bmd, hitRec, point );
					return hitRec.topLeft.add( hitBmd.getColorBoundsRect( 0xFF000000, 0, false ).topLeft );
				}
				
			}
			
			return null;
			
		}
		


	}
}