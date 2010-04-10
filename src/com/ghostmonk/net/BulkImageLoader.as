package com.ghostmonk.net {
	
	import flash.display.Bitmap;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	public class BulkImageLoader {
		
		
		private var _loadCue:Array;
		private var _current:int;
		private var _bulkAmount:int;
		
		private var _loadedCall:Function;
		private var _errrorCall:Function;
		private var _completeCall:Function;
		
		private var _defaultImage:String;
		
		
		public function completeCall( call:Function ):void {
			
			_completeCall = call;
			
		}
		
		
		
		public function BulkImageLoader(defaultImageURL:String, bulkAmount:int) {
			
			_bulkAmount = bulkAmount;
			_defaultImage = defaultImageURL;
			 
		}
		
		
		
		public function loadList( cue:Array, loadedCall:Function, errorCall:Function ):void {
			
			if( cue.length == 0 ) {
				throw new Error("BulkImageLoader::loadList - cue array must have more than 0 items");
			}
			
			_loadCue = cue;
			_loadedCall = loadedCall;
			_errrorCall = errorCall;
			
			var limit:int = Math.min(_bulkAmount, cue.length);
			
			for( var i:int = 0; i < limit; i++ ) {
				var loader:AssetLoader = new AssetLoader( _loadCue[ i ], onComplete, onIOError );
			}
			
			_current = i - 1;
		}
		
		
		
		public function destruct():void {
			
			_loadCue = null;
			_loadedCall = null;
			
		}
		
		
		
		private function loadNextImage():void {
			
			_current++;
			if( _current < _loadCue.length ) {
				var loader:AssetLoader = new AssetLoader( _loadCue[ _current ], onComplete, onIOError );
			}
			else if( _completeCall != null ) {
				_completeCall();
			}
			
		}
		
		
		
		private function onComplete(bitmap:Bitmap, index:int):void {
				
			_loadedCall(bitmap, index);
			loadNextImage();
			
		}
		
		
		
		private function onIOError( index:int ):void {
			 
			var loader:AssetLoader = new AssetLoader( _defaultImage, errorComplete );
			
		}
		
		
		
		private function errorComplete( bitmap:Bitmap, index:int ):void {
			
			if( _errrorCall != null ) {
				_errrorCall( bitmap, index );
			} 
			
			loadNextImage();
			
		}
		
		
	}
}