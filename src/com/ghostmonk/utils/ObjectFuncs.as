package com.ghostmonk.utils {
    
    import flash.utils.getQualifiedClassName;
    
    
    public class ObjectFuncs 
    {
            
        public static function objectToString( obj:Object, indent:String = "" ) : String 
        {    
            var output:String = "";
            
            for( var id:String in obj ) 
            {    
                var type:String = getQualifiedClassName( obj[ id ] );
                
                output += indent;
                
                if( type == "Array" || type == "Object"  ) 
                {
                    output += id + ": {\n" +objectToString( obj[ id ], indent + "  " )+ "}, \n";
                }
                else 
                {
                    output += id + ": " + obj[ id ] + ", \n";
                }
            }
            
            if( output.lastIndexOf( "," ) == output.length - 3 ) 
            {
                output = output.slice( 0, -3 );
            }
             
            return output;  
        } 
    }
}