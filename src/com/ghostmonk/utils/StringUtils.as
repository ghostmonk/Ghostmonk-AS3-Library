package com.ghostmonk.utils 
{    
    /**
     * 
     * @author nhillier 2009-09-02
     * 
     */
    public class StringUtils 
    {       
        /**
         * Returns the protocol characters of a url, before the first colon, ex: "http" 
         * @param url
         * @return 
         * 
         */
        public static function urlProtocol( url:String ) : String 
        {    
            return url.substr( 0, url.indexOf( ":" ) );   
        }
        
        /**
         * Useful for NetConnection.connect, passing the last portion of a URL after the final "/".
         * 
         * <code>
         * getApplication( "rtmpe://www.server.com/directory/myVideo.mp4" ) = "myVideo.mp4";
         * </code>
         * 
         * @param url
         * @return 
         * 
         */
        public static function getApplication( url:String ) : String 
        {    
            var server:String = getRTMPServer( url );
            return stripArgsFromURL( url.replace( server + "/", "" ) );   
        }
        
        public static function getRTMPServer( url:String ) : String 
        {	
        	var serverPattern:RegExp = /[a-zA-Z0-9]*:\/\/[a-zA-Z0-9\-\_\.:]*\/[a-zA-Z0-9\-\_]*/g;
        	return serverPattern.exec( url );	
        }
        
        /**
         * Returns a complete string from a url before the final "/".
         * 
         * <code>
         * getFullDirectory( "rtmpe://www.server.com/directory/myVideo.mp4" ) = "rtmpe://www.server.com/directory";
         * </code>
         *  
         * @param url
         * @return 
         * 
         */
        public static function getFullDirectory( url:String ) : String 
        {    
            var lastSlash:int = url.lastIndexOf( "/" );
            return url.substring( 0, lastSlash );   
        }
   		
        /**
         * Returns the file extension on a provided string. 
         * 
         * @param file
         * @return 
         * 
         */
        public static function getFileExtension( file:String ) : String 
        {   
            var output:String = file;
            output = StringUtils.stripArgsFromURL( output );
            output = output.substring( file.lastIndexOf( "." ) + 1 );
            
            return output;   
        }
        
        /**
         * Will remove all argument parameters from a url...
         *  
         * <code>
         * stripArgsFromURL( "http://www.myserver.com/myapp.html?a=1&b=2" ) = http://www.myserver.com/myapp.html  
         * </code>
         *  
         * @param url
         * @return 
         * 
         */
        public static function stripArgsFromURL( url:String ) : String 
        {    
            var questionMark:int = url.indexOf( "?" );
            
            return questionMark != -1 ? url.substring( 0, questionMark ) : url;   
        }
        
        /**
         * Will remove the provided character from the end of a string.
         * 
         * <code>
         * trimEnd( "William", "iam" ) = "Will";
         * </code>
         *  
         * @param source
         * @param characters
         * @return 
         * 
         */
        public static function trimEnd( source:String, characters:String ) : String 
        {    
            return source.replace( new RegExp( "("+characters+")+$", "" ), '' );   
        }
        
        /**
         * Will remove the provided character from the start of a string.
         * 
         * <code>
         * trimStart( "Goodyear", "Good" ) = "year";
         * </code>
         *  
         * @param source
         * @param characters
         * @return 
         * 
         */
        public static function trimStart( source:String, characters:String ) : String 
        {    
            return source.replace( new RegExp( "("+characters+")", "" ), '' );   
        }
        
        /**
         * If there is no slash at the end of the provided string, one will be added.
         * 
         * <code>
         * addSlash( "myDirectory" ) = "myDirectory/"
         * addSlash( "myDirectory/" ) = "myDirectory/"
         * </code>
         *  
         * @param url
         * @return 
         * 
         */
        public static function addSlash( url:String ) : String 
        {    
            var output:String = url;
            
            if( output.substr( output.length - 1 ) == "/" ) 
            {
                return output;
            } 
            
            return output + "/";        
        }
    }
}