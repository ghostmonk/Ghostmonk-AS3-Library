package com.ghostmonk.form {
	import flash.utils.Dictionary;
	
	

    /**
     *@author ghostmonk - 2009-06-24
     */
    public class FormFieldCollection {
    	
    	
    	
    	private var _fields:Dictionary;
    	private var _current:int;
    	private var _length:int;
    	
    	
    	
        public function FormFieldCollection() {
        	
        	_fields = new Dictionary();
        	_current = 0;
        	_length = 0;
        	
        }
        
        
        
        public function get fields() : Dictionary {
        	
        	return _fields;
        	
        }
        
        
        
        public function set current( value:int ):void {
        	
        	_current = value;
        	
        }
        
        
        
        public function reset():void {
        	
        	_current = 0;
        	
        }
        
        
        
        public function addField( field:FormField ):void {
        	
        	_fields[ _length ] = field;
        	_length++;
        	
        }
        
        
        
        public function get length():int {
        	
        	return _length;
        	
        }
        
        
        
        public function get currentField():FormField {
        	
        	var output:FormField = _current == length ? null : _fields[ _current ];
        	return output; 
        	
        }
        
        
        
        public function get nextField():FormField {
        	
        	var output:FormField = null;
        	_current++;
        	
        	if( _current == _length ) {
        		_current = 0;
        	}
        	else {
        		output = _fields[ _current ] as FormField;
        	}
        	
        	return output;
        	
        }
        
        
        
        public function getFieldByIndex( index:int ):FormField {
        	
        	return _fields[ index ] as FormField;
        	
        }
        
        
        
    }
}