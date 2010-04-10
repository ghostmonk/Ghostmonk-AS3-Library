package com.ghostmonk.display.color {
    
    public class RGBValues {
        
        
        private var _red:int;
        private var _green:int;
        private var _blue:int;
        
        
        public function RGBValues( r:int, g:int, b:int ) {
            
            _red = r;
            _green = g;
            _blue = b;
            
        }
        
        
        
        public function get red() : int {
         
            return _red;
            
        }
        
        
        
        public function get green() : int {
            
            return _green;
            
        }
        
        
        
        public function get blue() : int {
            
            return _blue;
            
        }
        

    }
}
