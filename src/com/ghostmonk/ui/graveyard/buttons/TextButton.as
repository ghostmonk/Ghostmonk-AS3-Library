package com.ghostmonk.ui.graveyard.buttons {
	
	import com.ghostmonk.text.EmbeddedText;
	
	import flash.display.*;
	import flash.events.MouseEvent;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class TextButton extends Sprite {
		
		
		
		private var _textColor:uint;
		private var _baseColor:uint;
		
		private var _text:EmbeddedText;
		private var _background:Bitmap;
		
		private var _isBgTextColorSwap:Boolean;
		
		
		
		/**
		 * 
		 * @param font
		 * @param textSize
		 * @param label
		 * @param textColor
		 * @param baseColor
		 * 
		 */
		public function TextButton( font:String, textSize:Number, label:String, textColor:uint, baseColor:uint ) {
			
			_text = new EmbeddedText( font, textSize, textColor, true );
			_text.text = label;
			
			_textColor = textColor;
			_baseColor = baseColor;
			
			_background = new Bitmap( new BitmapData( _text.width, _text.height, true, 0 ) );
			addChild( _background );
			addChild( _text ); 
			
			enable();
			mouseChildren = false;
			_isBgTextColorSwap = true;
			
		}
		
		
		
		public function set isBgTextColorSwap( value:Boolean ) : void {
			
			_isBgTextColorSwap = value;
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function enable():void {
			
			buttonMode = true;
			onMouseOut();
			addEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
			addEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function disable( isActive:Boolean = false ):void {
			
			buttonMode = false;
			removeEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
			removeEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
			
			if( isActive ) {
				onMouseOver();
			}
			else {
				onMouseOut();
			}
			
		}
		
		
		
		/**
		 * 
		 * @param e
		 * 
		 */
		protected function onMouseOut( e:MouseEvent = null ):void {
			
			_text.color = _textColor;
			_background.bitmapData.dispose();
			_background.bitmapData = new BitmapData( width, _text.height, true, 0 );
			
		}
		
		
		
		private function onMouseOver( e:MouseEvent = null ):void {
			
			_text.color = _baseColor;
			if( _isBgTextColorSwap ) {			
				_background.bitmapData = new BitmapData( width, _text.height, false, _textColor );
			}
				
		}
		
		
		
	}
}