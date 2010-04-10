package com.ghostmonk.ui.composed {
    
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.events.MouseEvent;

    public class SimpleMCToggleBtn extends EventDispatcher {
        
        
        
        private var _view:MovieClip;
        private var _clickCallback:Function;
        
        
        
        public function SimpleMCToggleBtn( view:MovieClip, clickCallback:Function ) {
            
            _view = view;
            _view.stop();
            _view.mouseChildren = false;
            
            enable();
            _clickCallback = clickCallback;
            
        }
        
        
        
        public function get view() : DisplayObjectContainer {
            
            return _view;
            
        }
        
        
        
        public function enable() : void {
            
            _view.buttonMode = true;
            _view.addEventListener( MouseEvent.CLICK, onClick );
            
        }
        
        
        
        public function disable() : void {
            
            _view.buttonMode = false;
            _view.removeEventListener( MouseEvent.CLICK, onClick );
            
        }
        
        
        
        public function set on( value:Boolean ) : void {
            
            if( value ) {
                _view.gotoAndStop( 1 );
            }
            else {
                _view.gotoAndStop( 2 );
            }
            
        }
        
        
        
        private function onClick( e:MouseEvent ) : void {
            
            var isOn:Boolean = _view.currentFrame == 1;
            
            if( isOn ) {
                _view.gotoAndStop( 2 );
            }
            else {
                _view.gotoAndStop( 1 );
            }
            
            _clickCallback( isOn );
            
        }
        
        
        
    }
}