package com.ghostmonk.media
{
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	
	import com.ghostmonk.display.graphics.shapes.InnerShadowRectangle;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;

	/** 
	 * @author ghostmonk
	 * 
	 */
	public class SoundSpectrum extends Sprite
	{
		private var _bg:InnerShadowRectangle;
		private var _view:Sprite;
		
		private var PLOT_HEIGHT:int;
		private const CHANNEL_LENGTH:int = 256;
		private var _compute:Function;
		
		public function SoundSpectrum()
		{
			addEventListener(Event.ADDED_TO_STAGE, drawBG);
			alpha = 0;
			_compute = drawBasic;
		}
		
		public function setSpectrumFunction(compute:Function):void
		{
			_compute = compute;
		}
		
		public function start():void
		{
			
			PLOT_HEIGHT = parent.height/2;
			addEventListener(Event.ENTER_FRAME, drawSpecturm);
		}
		
		public function stop():void
		{
			removeEventListener(Event.ENTER_FRAME, drawSpecturm);
		}
		
		public function show():void
		{
			start();
			Tweener.addTween(this, {alpha:1, time:0.5, transition:Equations.easeNone});
		}
		
		public function hide():void
		{
			Tweener.addTween(this, {alpha:0, time:0.5, transition:Equations.easeNone, onComplete:stop});
		}
		
		public function drawSpecturm(e:Event):void
		{	
			var bytes:ByteArray = new ByteArray();
			try {
				SoundMixer.computeSpectrum(bytes);
			} catch (e:Error) {
				trace(e);
			} 
			
			var g:Graphics = _view.graphics;
			
			_compute(g, bytes);
			
		}
		
		private function drawBasic(g:Graphics, bytes:ByteArray):void
		{
			g.clear();
       
            g.lineStyle(0, 0x8060B2, 0);
            g.beginFill(0x8060B2);
            g.moveTo(0, PLOT_HEIGHT);
            
            var n:Number = 0;
            
            for (var i:int = 0; i < CHANNEL_LENGTH; i++) 
            {
                n = (bytes.readFloat() * PLOT_HEIGHT);
                g.lineTo(i * 2, PLOT_HEIGHT - n);
            }
			
			g.lineTo(CHANNEL_LENGTH * 2, PLOT_HEIGHT);
            g.endFill();
 
            g.lineStyle(0, 0x12FFCF, 0);
            g.beginFill(0x12FFCF, 0.5);
            g.moveTo(CHANNEL_LENGTH * 2, PLOT_HEIGHT);
			
			for (i = CHANNEL_LENGTH; i > 0; i--) 
			{
                n = (bytes.readFloat() * PLOT_HEIGHT);
                g.lineTo(i * 2, PLOT_HEIGHT - n);
            }
  
			g.lineTo(0, PLOT_HEIGHT);
            g.endFill();
		}
		
		private function drawBG(e:Event):void
		{
			_bg = new InnerShadowRectangle(0x000000, parent.width, parent.height);
			_view = new Sprite();
			addChild(_bg);
			addChild(_view);
			removeEventListener(Event.ADDED_TO_STAGE, drawBG);
		}

	}
}