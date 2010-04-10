package com.ghostmonk.utils
{
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class SiteLoader extends EventDispatcher {
		
		
		
		private var _preloader:MovieClip;
		private var _mainLoader:Loader;
		private var _callback:Function;
		private var _content:Object;
		
		
		
		/**
		 * 
		 * @param url
		 * @param preloader
		 * 
		 */
		public function SiteLoader( url:String, preloader:MovieClip, callBack:Function ) {	
			
			_preloader = preloader;
			_mainLoader = new Loader();
			_preloader.stop();
			
			_preloader.alpha = 0;
			_callback = callBack;
			
			_mainLoader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onProgress );
			_mainLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, onComplete );			
			_mainLoader.load( new URLRequest( url ) );
			
		}
		
		
		
		/**
		 * 
		 * @param xPos
		 * @param yPos
		 * 
		 */
		public function postionProgressBar( xPos:Number, yPos:Number ):void {
			
			_preloader.x = xPos;
			_preloader.y = yPos;
			
		}
		
		
		public function cleanUp() : void {
			
			_mainLoader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_mainLoader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onComplete );
			_mainLoader = null;
			
		}
		
		
		
		private function onProgress( e:ProgressEvent ):void {
			
			var percent:Number = e.bytesTotal != 0 ? e.bytesLoaded / e.bytesTotal : 0;
			_preloader.gotoAndStop( Math.ceil( percent * 100 ) );
			
		}
		
		
		
		private function onComplete( e:Event ):void  {
			
			_callback( e.target.content );		
			cleanUp();
			
		}
		
		
				
	}
}