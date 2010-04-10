package com.ghostmonk.utils {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class FrameCounter extends Sprite {
		
		private var _fpsOutput:TextField;
		private var _secTracker:int;
		private var _frameTracker:int;
		private var _color:Number;
		private var _font:Font;
		private var _textFormat:TextFormat;
		
		
		
		/**
		 * 
		 * @param font
		 * 
		 */
		public function FrameCounter( font:Font ) {			
			
			_fpsOutput  = new TextField();
			_secTracker = new Date().getSeconds(); 
			_frameTracker = 0;
			_color = 0x444444;
			_font = font;
			_textFormat = new TextFormat( _font.fontName, 8, 0x444444 );
			
			_fpsOutput.embedFonts = true;
			_fpsOutput.defaultTextFormat = _textFormat;
			_fpsOutput.height = 10;
			_fpsOutput.textColor = _color;
			
			addChild( _fpsOutput );
				
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function start():void {
			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function stop():void {
			
			removeEventListener( Event.ENTER_FRAME, onEnterFrame );
			
		}
		
		
		
		private function onEnterFrame( e:Event ):void {
			
			var now:Date = new Date();
			var sec:int = now.getSeconds();
			
			if( _secTracker == sec ) {
				_frameTracker++;
			}
			else {
				_fpsOutput.text = "FPS: " + _frameTracker;
				_frameTracker = 0;	
			}
			
			_secTracker = sec;
			
		}
		
		
		
	}
}