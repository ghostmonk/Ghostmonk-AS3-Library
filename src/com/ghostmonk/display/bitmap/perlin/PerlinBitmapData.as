package com.ghostmonk.display.bitmap.perlin {
	
	import flash.display.BitmapData;

	public class PerlinBitmapData extends BitmapData {
		
		
		
		private var _baseX:Number;
		private var _baseY:Number;
		private var _octaves:uint;
		private var _randomSeed:int;
		private var _stitch:Boolean;
		private var _fractalNoise:Boolean;
		private var _channel:uint;
		private var _grayScale:Boolean;
		private var _offsets:Array;
		
		
		
		public function PerlinBitmapData( width:int, height:int ) {
			
			super( width, height, true, 0x00000000 );
			
			_baseX = width;
			_baseY = height;
			_octaves = 3;
			_randomSeed = 10;
			_stitch = false;
			_fractalNoise = false;
			_channel = 3;
			_grayScale = false;
			_offsets = new Array();
			update();
			
		}
		
		
		
		public function get baseX() : Number {
			
			return _baseX;
			
		}
		
		public function set baseX( value:Number ) : void {
			
			_baseX = value; 
			update();
			
		} 
		
		
		
		public function get baseY() : Number {
			
			return _baseY;
			
		}
		
		public function set baseY( value:Number ) : void {
			
			_baseY = value; 
			update();
			
		}
		
		
		 
		public function get octaves() : uint {
			
			return _octaves;
			
		}
		
		public function set octaves( value:uint ) : void {
			
			_octaves = value; 
			update();
			
		}
		
		
		 
		public function get randomSeed() : int {
			
			return _randomSeed;
			
		}
		
		public function set randomSeed( value:int ) : void {
			
			_randomSeed = value; 
			update();
			
		} 
		
		
		 
		public function get stitch() : Boolean {
			
			return _stitch;
			
		}
		
		public function set stitch( value:Boolean ) : void {
			
			_stitch = value; 
			update();
			
		} 
		
		
		 
		public function get fractalNoise() : Boolean {
			
			return _fractalNoise;
			
		}
		
		public function set fractalNoise( value:Boolean ) : void {
			
			_fractalNoise = value; 
			update();
			
		} 

		
		
		 
		public function get channel() : uint {
			
			return _channel;
			
		}
		
		public function set channel( value:uint ) : void {
			
			_channel = value; 
			update();
			
		} 
		
		
		 
		public function get grayScale() : Boolean {
			
			return _grayScale;
			
		}
		
		public function set grayScale( value:Boolean ) : void {
			
			_grayScale = value; 
			update();
			
		} 		
		
		
		 
		public function get offsets() : Array {
			
			return _offsets;
			
		}
		
		public function set offsets( value:Array ) : void {
			
			_offsets = value; 
			update();
			
		} 		
		
		
		
		private function update() : void {
			
			perlinNoise( _baseX, _baseY, _octaves, _randomSeed, _stitch, _fractalNoise, _channel, _grayScale, _offsets );
			
		}
		
		
	}
}