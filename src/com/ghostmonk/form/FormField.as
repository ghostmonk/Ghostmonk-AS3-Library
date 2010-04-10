package com.ghostmonk.form {
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.text.TextField;

    /**
     *@author ghostmonk - 2009-06-24
     */
    public class FormField {
    	
    	private var _index:int;
    	private var _label:String;
    	private var _textField:TextField;
    	private var _background:Sprite;
    	private var _filters:Array;
    	private var _errorText:String;
    	private var _eval:RegExp;
    	private var _isRequired:Boolean;
    	
    	
        public function FormField( index:int, label:String, errorText:String, textField:TextField, background:Sprite, regEval:RegExp = null ) {
        	
        	_index = index;
        	_label = label;
        	_errorText = errorText;
        	
        	_textField = textField;
        	_textField.text = _label;
        	
        	_background = background;
        	_eval = regEval;
        	
        	enable();
        	
        }
    	
    	
    	
    	public function set maxLength( value:int ):void {
    		
    		_textField.maxChars = value;
    		
    	}
    	
    	
    	public function set restriction( value:String ):void {
    		
    		_textField.restrict = value;
    		
    	}
    	
    	
    	
    	public function get errorText():String {
    		
    		return _errorText;
    		
    	}
    	
    	
    	
    	public function get index():int {
    		
    		return _index;
    		
    	}
    	
    	
    	
    	public function get label():String {
    		
    		return _label;
    		
    	}
    	
    	
    	
    	public function get textField():TextField {
    		
    		return _textField;
    		
    	}
    	
    	
    	
    	public function get background():Sprite {
    		
    		return _background;
    		
    	}
    	
    	
    	
    	public function set filters( value:Array ):void {
    		
    		_filters = value;
    		
    	}
    	
    	
    	public function set isRequired( value:Boolean ):void {
    		
    		_isRequired = value;
    		
    	}
    	
        
        
        
        public function selectAll( stage:Stage ):void {
        	
            stage.focus = _textField;
            _textField.setSelection( 0, _textField.text.length );
            
        }
        
        
        
        public function disable():void {
        	
            _textField.mouseEnabled = false;
            _textField.selectable = false;
            _textField.removeEventListener( FocusEvent.FOCUS_IN, onFocusIn );
            _textField.removeEventListener( FocusEvent.FOCUS_OUT, onFocusOut );
            
        }
        
        
        
        public function enable():void {
        	
            _textField.mouseEnabled = true;
            _textField.selectable = true;
            _textField.addEventListener( FocusEvent.FOCUS_IN, onFocusIn );
            _textField.addEventListener( FocusEvent.FOCUS_OUT, onFocusOut );  
            
        }
        
        
        
        public function get isValidLength():Boolean {   
        	
        	var validLength:Boolean = true; 
        	
        	if( _isRequired ) {
        		validLength = _textField.text == "" || _textField.text.substring( 0, _textField.text.length ) == _label ? false : true;
        	}
        	
            return validLength;
            
        }
        
        
        
        public function get isValid():Boolean {
        	
        	var regResult:Boolean = true;
        	
        	if( _eval ) {
        		regResult = _eval.test( _textField.text );
        	}
        	
        	return isValidLength && regResult; 
        }
        
        
        
        public function reset():void {
        	
            _textField.text = _label;
            _textField.scrollH = 0;
            _background.filters = [];
            
        }
        
        
        
        private function onFocusIn( e:FocusEvent ):void {
        	   
            _textField.text = _textField.text.substring( 0, _label.length ) == _label ? "" : _textField.text;
            _background.filters = _filters;
            
        }
        
        
        
        private function onFocusOut( e:FocusEvent ):void {
        	 
            _textField.text = _textField.text == "" ? _label : _textField.text;
            _background.filters = [];
            
            
        }
        
        
        
    }
}