package com.ghostmonk.utils
{
	public class XMLUtils
	{
		public static function XMLListToArray( list:XMLList ) : Array
		{
			var output:Array = [];
			for each( var node:XML in list )
			{
				output.push( node.toString() );
			}
			return output;
		}
	}
}