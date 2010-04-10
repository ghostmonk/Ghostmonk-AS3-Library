package com.ghostmonk.form.model {

    /**
     *@author ghostmonk - 2009-06-24
     */
    public class FormLocalizationStrings {
    	
    	
    	private var _title:String;
    	
    	private var _email:String;
    	private var _firstName:String;
    	private var _lastname:String;
    	private var _postalCode:String;
    	private var _age:String;
    	
    	private var _emailError:String;
    	private var _firstNameError:String;
    	private var _lastNameError:String;
    	private var _postalCodeError:String;
    	
    	
    	
    	public function get title():String {
    		
    		return _title;
    		
    	}

    	public function set title( v:String ):void {
    		
    		_title = v;
    		
    	}
    	
    	

    	public function get emailError():String {

            return _emailError;

        }

        public function set emailError( v:String ):void {

            _emailError = v;

        }



    	public function get postalCodeError():String {

    		return _postalCodeError;

    	}

    	public function set postalCodeError( v:String ):void {

    		_postalCodeError = v;

    	}



    	public function get lastNameError():String {

    		return _lastNameError;

    	}

    	public function set lastNameError( v:String ):void {

    		_lastNameError = v;

    	}



    	public function get firstNameError():String {

    		return _firstNameError;

    	}

    	public function set firstNameError( v:String ):void {

    		_firstNameError = v;

    	}



    	public function get age():String {

    		return _age;

    	}

    	public function set age( v:String ):void {

    		_age = v;

    	}


        
    	public function get postalCode():String {

    		return _postalCode;

    	}

    	public function set postalCode( v:String ):void {

    		_postalCode = v;

    	}
        
        
        
    	public function get lastname():String {

    		return _lastname;

    	}

    	public function set lastname( v:String ):void {

    		_lastname = v;

    	}
        
        
        
    	public function get firstName():String {

    		return _firstName;

    	}

    	public function set firstName( v:String ):void {

    		_firstName = v;

    	}
    	
    	
    	
    	public function get email():String {

            return _email;

        }

        public function set email( v:String ):void {

            _email = v;

        }

    	

    }
}