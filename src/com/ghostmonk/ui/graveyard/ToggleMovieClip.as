package com.ghostmonk.ui.graveyard {
	
	import caurina.transitions.*;
	
	import com.ghostmonk.events.ToggleEvent;
	
	import flash.display.*;
	import flash.events.MouseEvent;
	
	[Event(name="toggle", type="com.ghostmonk.events.ToggleEvent")]

	/**
	 * You must have The tweener library installed to use this class
	 * and you must set DisplayShortcuts.init() in the main class
	 * 
	 * <p>A toggle event is dispatched with the Boolean isOn.. indicating the state of the button
	 * when the movieclip is on frame 1, the clip is considered off... 
	 * when the clip is on totalFrames the clip is considerd on</p> 
	 * 
	 * <p>The button is initialized in an off state</p>
	 *  
	 * @author ghostmonk 29/11/2008
	 * 
	 */
	public class ToggleMovieClip extends Sprite {
		
		
		
		private var _clip:MovieClip;
		private var _isOn:Boolean;
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get isOn():Boolean {
			
			return _isOn;
			
		}
		
		
		
		/**
		 * 
		 * @param clip
		 * 
		 */
		public function ToggleMovieClip( clip:MovieClip ) {
			
			_clip = clip;
			_isOn = false;
			addChild(_clip);
			mouseChildren = false;
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, onClick);
				
		}
		
		
		
		private function onClick(e:MouseEvent):void {
			
			_isOn = !_isOn;
			
			var destFrame:int = _isOn ? _clip.totalFrames : 1;
			var time:Number = Math.abs(_clip.currentFrame - destFrame)/stage.frameRate;
			
			Tweener.addTween(_clip, {_frame:destFrame, time:time, transition:Equations.easeNone});
			
			dispatchEvent(new ToggleEvent(ToggleEvent.TOGGLE, _isOn));
			
		}
		
		
		
	}
}