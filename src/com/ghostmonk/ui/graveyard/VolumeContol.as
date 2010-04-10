package com.ghostmonk.ui.graveyard {
	
	import com.ghostmonk.events.PercentageEvent;
	import com.ghostmonk.ui.graveyard.video.HorizontalScrollDrag;
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	
	/**
	 *  
	 * @author ghostmonk 22/11/2008
	 * 
	 */
	public class VolumeContol extends Sprite {
		
		
		
		private var _scrollDrag:HorizontalScrollDrag;
		
		
		
		/**
		 * 
		 * @param volumeControl
		 * 
		 */
		public function VolumeContol( volumeControl:MovieClip ) {
			
			_scrollDrag = new HorizontalScrollDrag( volumeControl );
			_scrollDrag.setScrollRect( 0.5, true );
			
			volumeControl.doubleClickEnabled = true;
			volumeControl.addEventListener( MouseEvent.DOUBLE_CLICK, onDoubleClick );
			
			_scrollDrag.addEventListener( PercentageEvent.CHANGE, onChange );
			
			SoundMixer.soundTransform = new SoundTransform( 0.5 );
			
		}
		
		
		
		private function onChange( e:PercentageEvent ):void {
			
			SoundMixer.soundTransform = new SoundTransform( e.percent );
			
		}
		
		
		
		private function onDoubleClick( e:MouseEvent ):void {
			
			_scrollDrag.setScrollRect( 0, true );
			
		}
		
		
		
	}
}