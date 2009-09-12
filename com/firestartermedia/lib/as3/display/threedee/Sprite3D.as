package com.firestartermedia.lib.as3.display.threedee
{
	import com.firestartermedia.lib.as3.utils.NumberUtil;
	
	import flash.display.Sprite;

	public class Sprite3D extends Sprite
	{
		private var _angleX:Number								= 0;
		private var _angleY:Number								= 0;
		private var _angleZ:Number								= 0;
		private var _depth:Number								= 1;
		private var _x:Number									= 0;
		private var _y:Number									= 0;
		private var _z:Number									= 0;
		
		private var _depthInitial:Number;
			
		public function Sprite3D()
		{
			super();
		}
		
		private function calculatePosition():void
		{
			calculateDepth();
			
			super.x		= _x;
			super.y		= _y;
			super.z		= _z;
			
			_angleX		= NumberUtil.actualDegrees( rotationX );
			_angleY		= NumberUtil.actualDegrees( rotationY );
			_angleZ		= NumberUtil.actualDegrees( rotationZ );
			
			trace( angleX );
		}
		
		private function calculateDepth():void
		{			
			var depthX:Number		= NumberUtil.calculateOppposite( rotationX, height, true ) + NumberUtil.calculateAdjacent( rotationX, _depthInitial, true );
			var depthY:Number		= NumberUtil.calculateOppposite( rotationX, width / 2, true ) + NumberUtil.calculateAdjacent( rotationX, _depthInitial, true );
			var depthZ:Number		= NumberUtil.calculateOppposite( rotationX, height / 2, true );
			var newDepth:Number		= _depthInitial;
			
			if ( depthX > depthY && depthX > depthZ )
			{
				newDepth = depthX;
			}
			
			if ( depthY > depthX && depthY > depthZ )
			{
				newDepth = depthY;
			}
			
			if ( depthZ > depthX && depthZ > depthY )
			{
				newDepth = depthX;
			}
			
			if ( newDepth < 0 )
			{
				newDepth = newDepth * -1;
			}
			
			_depth = newDepth;
		}
		
		public function get angleX():Number
		{
			return _angleX;
		}
		
		public function get angleY():Number
		{
			return _angleY;
		}
		
		public function get angleZ():Number
		{
			return _angleZ;
		}
		
		public function set depth(value:Number):void
		{
			if ( !_depthInitial )
			{
				_depthInitial = value;
			}
			
			_depth = value;
			
			calculatePosition();
		}
		
		public function get depth():Number
		{
			return _depth;
		}
		
		override public function set rotation(value:Number):void
		{
			super.rotation = value;
			
			calculatePosition();
		}
		
		override public function set rotationX(value:Number):void
		{
			super.rotationX = value;
			
			calculatePosition();
		}
		
		override public function set rotationY(value:Number):void
		{
			super.rotationY = value;
			
			calculatePosition();
		}
		
		override public function set rotationZ(value:Number):void
		{
			super.rotationZ = value;
			
			calculatePosition();
		}
		
		override public function set x(value:Number):void
		{
			_x = value;
			
			calculatePosition();
		}
		
		override public function set y(value:Number):void
		{
			_y = value;
			
			calculatePosition();
		}
		
		override public function set z(value:Number):void
		{
			_z = value;
			
			calculatePosition();
		}
	}
}