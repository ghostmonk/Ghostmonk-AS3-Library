package com.ghostmonk.net {

    import flash.events.Event;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    
    /**
     *@author ghostmonk - 2009-06-24
     */
    public class ComplexURLLoader extends URLLoader {
        
        
        
        private var _request:URLRequest;
        private var _completeCall:Function;
        
        
        
        public function ComplexURLLoader( url:String ) {
            
            _request = new URLRequest( url );    
            
        }
        
        
        
        public function setVariables( variables:Object, submitMethodType:String = "get" ):void {
        	
        	_request.method = submitMethodType;
        	var vars:URLVariables = new URLVariables();
        	
        	for( var value:* in variables ) {
        		vars.value = variables.value;
        	}
        	
        	_request.data = vars;
        	
        }
        
        
        
        public function sendRequest( callBack:Function = null ):void {
        	
        	_completeCall = callBack;
        	addEventListener( Event.COMPLETE, onComplete );
        	addEventListener( IOErrorEvent.IO_ERROR, onIOError );
        	addEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityError );
        	addEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
        	
        }
        
        
        
        private function onComplete( e:Event ):void {
        	
            if( _completeCall != null ) {        	
                _completeCall( e.target.data );	
            }
            else {
            	trace( e );
            }
            
            cleanUp();
            
        }
        
        
        
        private function onIOError( e:IOErrorEvent ):void {
        	trace( e );
        	cleanUp();
        }
        
        
        
        private function onSecurityError( e:SecurityErrorEvent ):void {
        	trace( e );
        	cleanUp();
        }
        
        
        
        private function onHTTPStatus( e:HTTPStatusEvent ):void {
        	trace( e );
        	cleanUp();
        }
        
        
        
        private function cleanUp():void {
        	
        	removeEventListener( Event.COMPLETE, onComplete );
            removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
            removeEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityError );
            removeEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
            
            _request = null;
            _completeCall = null;
            delete this;
        	
        }
        
        
        
    }
}