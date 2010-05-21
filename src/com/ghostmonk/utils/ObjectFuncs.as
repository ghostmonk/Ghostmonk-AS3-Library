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
                var isRecursive:Boolean = type == "Array" || type == "Object"; 
                
                if(  isRecursive )
                    output += id + ": {\n" +objectToString( obj[ id ], indent + "  " )+ "}, \n";
                else 
                    output += id + ": " + obj[ id ] + ", \n";
            }
            
            if( output.lastIndexOf( "," ) == output.length - 3 ) 
                output = output.slice( 0, -3 );
             
            return output;  
        }
        
        public static function toArray( table:Object ) : Array
        {
        	var output:Array = [];
			for each( var thing:* in table ) output.push( thing );
			return output;
        }
    
	    public static function clone( input:Object ) : Object
		{
			var output:Object = {};
			for( var id:String in input )
			{
				var value:* = input[ id ];
				output[ id ] = value.toString() === "[object Object]" ? clone( value ) : value;
			}
			
			return output;
		}
    }
}