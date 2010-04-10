package com.ghostmonk.form.model.parseMethods {
	
	import com.ghostmonk.form.model.FormLocalizationStrings;
	import com.ghostmonk.form.model.IFormLocalizationFactory;

    /**
     *@author ghostmonk - 2009-06-24
     */
    public class FormLocalizationXML implements IFormLocalizationFactory {
    	
    	private var _formStrings:FormLocalizationStrings;
    	
        public function FormLocalizationXML( xmlData:XML ) {
        	        	
        	_formStrings = new FormLocalizationStrings();
        	
        	_formStrings.title = xmlData.title;
        	
        	_formStrings.firstName = xmlData.firstName.@field;
        	_formStrings.firstNameError = xmlData.firstName.@error;
        	
        	_formStrings.lastname = xmlData.lastName.@field;
        	_formStrings.lastNameError = xmlData.lastName.@error;
        	
        	_formStrings.email = xmlData.email.@field;
        	_formStrings.emailError = xmlData.email.@error;
        	
        	_formStrings.age = xmlData.age.@field;
        	
        	_formStrings.postalCode = xmlData.postalcode.@field;
        	_formStrings.postalCodeError = xmlData.postalcode.@error;
        	
        }
        
        public function get formStrings():FormLocalizationStrings {
        	
        	return _formStrings;
        	
        } 
        
        
    }
}