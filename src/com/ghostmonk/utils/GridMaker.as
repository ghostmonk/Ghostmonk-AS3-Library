package com.ghostmonk.utils {
	
	import flash.display.Sprite;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class GridMaker {
		
		private static var _lineStyleConfig:Object = { thickness:0, color:0xFFFFFF, alpha:0.5 };
		
		public static function lineStyle( thickness:Number, color:uint, alpha:Number = 0.5 ) : void 
		{	
			_lineStyleConfig = { thickness:thickness, color:color, alpha:alpha };	
		}
		
		public static function drawGrid( display:Sprite, xDivs:int, yDivs:int ) : void 
		{	
			var xInterval:Number = display.width / xDivs;
			var yInterval:Number = display.height / yDivs;
			display.graphics.lineStyle( _lineStyleConfig.thickness, _lineStyleConfig.color, _lineStyleConfig.alpha );
			
			var displayHeight:Number = display.height;
			var displayWidth:Number = display.width;
			
			for( var i:int = 1; i < xDivs; i++ ) 
			{
				var xPos:Number = i * xInterval;
				display.graphics.moveTo( xPos, 0 );
				display.graphics.lineTo( xPos, displayHeight );
			}
			
			for( i = 1; i < yDivs; i++ ) 
			{
				var yPos:Number = i * yInterval;
				display.graphics.moveTo( 0, yPos );
				display.graphics.lineTo( displayWidth, yPos );
			}	
		}
	}
}