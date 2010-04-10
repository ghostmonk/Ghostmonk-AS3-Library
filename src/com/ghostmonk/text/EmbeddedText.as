package com.ghostmonk.text {
	
	import caurina.transitions.Tweener;
	
	import flash.events.FocusEvent;
	import flash.text.*;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class EmbeddedText extends TextField {
		
		private var _format:TextFormat;
		
		private var _fieldHeight:Number;
		private var _fieldWidth:Number;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get fieldWidth():Number {
			
			return _fieldWidth;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get fieldHeight():Number {
			
			return _fieldHeight;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get format():TextFormat {
			
			return _format;
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function setFormat():void {
			
		 	defaultTextFormat = _format;	
		 	
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function setFontSize( value:int ):void {
			
			format.size = value;
			setFormat();
			
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set color( value:uint ):void {
			
			format.color = value;
			setTextFormat( format );
			
		}
		
		
		
		/**
		 * 
		 * @param font
		 * @param size
		 * @param color
		 * @param singleLineAuto
		 * @param embed
		 * 
		 */
		public function EmbeddedText( font:String, size:Number,	color:Number, singleLineAuto:Boolean = false, embed:Boolean = true,	isSelectable:Boolean = false ) {
			
			_fieldHeight = 0;
			_format = new TextFormat( font, size, color );
			_format.align = TextFormatAlign.LEFT;
			
			defaultTextFormat = _format;
			
			selectable = isSelectable;
			mouseEnabled = isSelectable;
			embedFonts = embed;
			gridFitType = GridFitType.PIXEL;
			antiAliasType = AntiAliasType.ADVANCED;
			
			if( singleLineAuto ) {
				setSingleAuto();
			}
			else {
				defaultFormat();
			}
			
		}
		
		
		
		/**
		 * 
		 * @param txt
		 * @param maxHeight
		 * @param maxFontSize
		 * 
		 */
		public function testMetrics( txt:String, maxHeight:Number, maxFontSize:int ):void {
			
			format.size = maxFontSize;
			defaultTextFormat = format;
			
			var currentSize:int = maxFontSize;
			testHeight( txt );
			
			while( testHeight( txt ) > maxHeight ) {
				format.size = currentSize--;
				defaultTextFormat = format;	
			}
				
			Tweener.addTween( this, { _text:txt, time:0.5, transition:'linear' } );
			
		}
		
		
		
		/**
		 * 
		 * @param txt
		 * @return 
		 * 
		 */
		public function testWidth( txt:String ):Number {
			
			text = txt;
			var w:Number = _fieldWidth = width;
			text = "";
			return w;
			
		}
		
		
		
		/**
		 * 
		 * @param txt
		 * @return 
		 * 
		 */
		public function testHeight( txt:String ):Number {
			
			text = txt;
			var h:Number = height;
			text = "";
			_fieldHeight = h;
			return h;
			
		}
		
		
		
		private function defaultFormat():void {
			
			autoSize = TextFieldAutoSize.LEFT;
			multiline = true;
			wordWrap = true;
			
		}
		
		
		
		private function setSingleAuto():void {
			
			width = 0;
			multiline = false;
			wordWrap = false;
			autoSize = TextFieldAutoSize.LEFT;
			
		}
		
		
		
	}
}