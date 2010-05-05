package com.ghostmonk.utils
{
	/**
	 * A utility class with general string cleaning functions
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class StringCleaner
	{
		private var _boldReg:RegExp;
		private var _boldEndReg:RegExp;
		private var _divReg:RegExp;
		private var _divEndReg:RegExp;
		private var _spacesReg:RegExp;		
		private var _addNewLineReg:RegExp;
		
		public function StringCleaner() 
		{	
			_boldReg = /<strong>/gi;
			_boldEndReg = /<\/strong>/gi;
			_divReg = /<div\b[^>]*>(.*?)/gi;
			_divEndReg = /<\/div\b[^>]*>(.*?)/gi;
			_spacesReg = /\s{2,}/gi;
			_addNewLineReg = /<\/p><p>/gi;	
		}
		
		/**
		 * Removes &lt;div&gt; tags and contained attributes 
		 * <p>cleans out unnecessary spaces and line brakes</p> 
		 * <p>adds an extra line break between paragraphs</p>
		 * <p>replaces &lt;strong&gt; with &lt;bold&gt;</p> 
		 * 
		 * @param input
		 * @return 
		 * 
		 */
		public function htmlOutput( input:String ) : String 
		{	
			var output:String = '';
			
			output = input.replace(_divReg,"");	
			output = output.replace(_divEndReg,"");	
			output = output.replace(_spacesReg,"");
			output = output.replace(_addNewLineReg, "</p>\n<p>");
			output = output.replace(_boldReg,"<b>");
			output = output.replace(_boldEndReg,"</b>");
			
			return output;	
		}
	}
}