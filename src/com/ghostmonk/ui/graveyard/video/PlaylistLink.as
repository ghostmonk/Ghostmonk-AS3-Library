package com.ghostmonk.ui.graveyard.video {
	
	import com.ghostmonk.media.video.events.VideoLoadEvent;
	import com.ghostmonk.ui.graveyard.buttons.TextButton;
	
	import flash.events.MouseEvent;

	[Event(name="loadVideo", type="com.ghostmonk.events.VideoLoadEvent")]

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class PlaylistLink extends TextButton {
		
		
		
		private var _url:String;
		
		
		
		/**
		 * 
		 * @param font
		 * @param textSize
		 * @param label
		 * @param url
		 * @param textColor
		 * @param baseColor
		 * @param width
		 * 
		 */
		public function PlaylistLink( font:String, textSize:Number, label:String, url:String, textColor:uint, baseColor:uint, width:Number ) {
			
			super( font, textSize, label, textColor, baseColor );
			_url = url;
			addEventListener( MouseEvent.CLICK, onClick );
			
		}
		
		
		
		private function onClick( e:MouseEvent ):void {
			
			dispatchEvent( new VideoLoadEvent( VideoLoadEvent.LOAD_VIDEO, _url ) );
			
		}
		
		
		
	}
}