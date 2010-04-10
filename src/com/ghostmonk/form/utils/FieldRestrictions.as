package com.ghostmonk.form.utils {

    /**
     *@author ghostmonk - 2009-06-24
     */
    public class FieldRestrictions {
        
        
        
        private const _alpha:String =  "A-Za-z";
        private const _frenchChars:String = "°‘’“”ùæçéèêëîïôœùûü«»ÜÛÙŒÔÏÎËÊÈÉÇÆÄÂÀ’àâá"; 
        private const _email:String = "A-Za-z@\\-_.0-9";
        private const _numeric:String = "0-9";
        
        
        
        public function get numeric():String {
    
        	return _numeric;
        	
        }
        
        
        
        public function get email():String {
    
        	return _email;
        	
        }
        
        

        public function get frenchChars():String {
    
        	return _frenchChars;
        	
        }
        
        
        
        public function get alpha():String {
    
        	return _alpha;
        	
        }
        
        
        
        public function get alphaNumericSpace() : String {
        	
        	return _alpha + _numeric + " ";
        	
        }
        
        
        
        public function get alphaSpace() : String {
        	
        	return _alpha + " ";
        	
        }

    }
}