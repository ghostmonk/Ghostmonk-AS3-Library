package com.ghostmonk.form.utils {

    /**
     *@author ghostmonk - 2009-06-24
     */
    public class RegExFormEvaluations {
    
        private const _emailEvaluation:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
        private const _postalCodeEvaluation:RegExp = /^([ABCEGHJ-NPRSTVXYabceghj-nprstvxy]\d[ABCEGHJ-NPRSTV-Zabceghj-nprstv-z])\ {0,1}(\d[ABCEGHJ-NPRSTV-Zabceghj-nprstv-z]\d)$/;
        
        public function get email():RegExp {
        	return _emailEvaluation;
        }
        
        public function get postalCode():RegExp {
        	return _postalCodeEvaluation;
        }
        
    }
}