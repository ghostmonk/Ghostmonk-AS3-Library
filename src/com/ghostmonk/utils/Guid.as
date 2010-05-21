package com.ghostmonk.utils
{
	import com.adobe.crypto.SHA1;
	
	public class Guid
	{
		public static function create( key:String = "" ) : String
		{
			var time:Number = new Date().getTime();
			var rand:Number = Math.random();
			var sha1:String = SHA1.hash( time + rand + key );
			return 	sha1.substr(0, 8) + "-" + 
					sha1.substr(8, 4) + "-" + 
					sha1.substr(12, 4) + "-" + 
					sha1.substr(16, 4) + "-" + 
					sha1.substr(20, 12).toUpperCase();
		}
	}
}