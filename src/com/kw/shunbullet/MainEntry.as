package com.kw.shunbullet
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.sensors.Accelerometer;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent; 

	public class MainEntry extends Sprite
	{
		/* variable declaration */
		private var _bullets:Vector.<MovieClip>;
		private var _airplane:MovieClip;
		private var _accX:Number;
		private var _accY:Number;
		private var _acc:Accelerometer;
		// constant
		private static const G:Number = 0.8;
		private static const AIRPLANE_SPEED:Number = 10;
		private static const BULLET_COUNT:Number = 100;
		private static const BULLET_SPEED:Number = 9;
		private static const BULLET_INIT_R:Number = 400;
		var STG_W:int = stage.stageWidth;
		var STG_H:int = stage.stageHeight;

		/* constructor */
		public function MainEntry()
		{
			// stage init
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;

			// init bullets
			_bullets = new Vector.<MovieClip > (BULLET_COUNT,true);
			for (var i:int = 0; i < BULLET_COUNT; i++)
			{
				//var bullet:MovieClip = new Bullet_mc;
				var bullet:MovieClip = new LineBullet_mc;
				bullet.cacheAsBitmap = true;
				var bul_ang:Number = Math.random() * 360;
				bullet.x = STG_W / 2 + BULLET_INIT_R * Math.cos(bul_ang*Math.PI/180);
				bullet.y = STG_H / 2 - BULLET_INIT_R * Math.sin(bul_ang*Math.PI/180);
				bullet.rotation = -bul_ang + (0.5-Math.random())*100;
				_bullets[i] = bullet;
				addChild(bullet);
			}

			// init airplane
			_airplane = new Airplane1_mc  ;
			_airplane.x = STG_W / 2;
			_airplane.y = STG_H / 2;
			addChild(_airplane);
			_airplane.addEventListener(Event.ENTER_FRAME, moveAirplane);

			// init accelerometer
			_accX = 0;
			_accY = 0;
			_acc = new Accelerometer();
			_acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdatedHandler);

			trace("MainEntry");
		}

		/* Acc update event handler */
		private function onAccUpdatedHandler(e:AccelerometerEvent):void
		{
			_accX = e.accelerationX;
			_accY = e.accelerationY;
		}

		/* Move airplane handler */
		private function moveAirplane(evt:Event)
		{
			_airplane.x -=  _accX * AIRPLANE_SPEED;
			_airplane.y +=  _accY * AIRPLANE_SPEED;
			if (_airplane.x > (STG_W - _airplane.width / 2))
				_airplane.x = STG_W - _airplane.width / 2;
			if (_airplane.x < (0 + _airplane.width / 2))
				_airplane.x = 0 + _airplane.width / 2;
			if (_airplane.y > (STG_H - _airplane.width / 2))
				_airplane.y = STG_H - _airplane.width / 2;
			if (_airplane.y < (0 + _airplane.width / 2))
				_airplane.y = 0 + _airplane.width / 2;
		}
	}
}