package com.ghostmonk.events {

    
    import flash.events.Event;
    
    /**
     *@author ghostmonk - 2009-06-24
     */
    public class FormEvent extends Event {
        
        
        
        public static const FORM_SUBMIT:String = "formSubmit";
        
        
        
        public function FormEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
        	
        	super(type, bubbles, cancelable);
        	
        }
        
        
        override public function clone() : Event {
        	
        	return new FormEvent( type, bubbles, cancelable );
        	
        }
        
    }
}