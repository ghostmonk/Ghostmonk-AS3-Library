package com.ghostmonk.display.color {
    
    public class ColorConversion {
        
        
        public static function hexToRGB( color:uint ) : RGBValues {
            
            var r:uint = color >> 16; 
            var greenBlue:uint = color - ( r << 16 ) 
            var g:uint = greenBlue >> 8; 
            var b:uint = greenBlue - ( g << 8 ); 
            
            return new RGBValues( r, g, b );
            
        }
        

    }
}