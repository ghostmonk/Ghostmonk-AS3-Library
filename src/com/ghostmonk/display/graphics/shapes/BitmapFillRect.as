package com.ghostmonk.display.graphics.shapes {
	
	import flash.display.BitmapData;
	import flash.display.Sprite;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class BitmapFillRect extends Sprite {
		
		
		
		private var _data:BitmapData;
		
		
		
		/**
		 * 
		 * @param data
		 * 
		 */
		public function BitmapFillRect( data:BitmapData ) {
			
			_data = data;
			
		}
		
		
		
		/**
		 * 
		 * @param width
		 * @param height
		 * 
		 */
		public function make( width:Number, height:Number ):void {
			
			graphics.clear();
			graphics.beginBitmapFill(_data);
			graphics.drawRect(0,0,width,height);
			graphics.endFill();
			
		}
		
		
		
	}
}