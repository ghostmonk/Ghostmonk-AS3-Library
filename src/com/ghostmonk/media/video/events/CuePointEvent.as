package com.ghostmonk.media.video.events {
    
    import flash.events.Event;

    
    public class CuePointEvent extends Event {
        
        
        
        public static const ON_CUE_POINT:String = "onCuePoint";
        
        private var _cuepointData:Object;
        
        
        
        public function CuePointEvent( type:String, cuePointData:Object, bubbles:Boolean = false, cancelable:Boolean = false ) {
            
            _cuepointData = cuePointData;
            super( type, bubbles, cancelable );
            
        }
        
        
        
        public function get cuePointData() : Object {
            
            return _cuepointData;
            
        }
        
        
        
        override public function clone() : Event {
            
            return new CuePointEvent( type, cuePointData, bubbles, cancelable ); 
            
        }
        
        
        
    }
}