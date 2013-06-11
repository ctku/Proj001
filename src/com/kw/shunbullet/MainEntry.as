package com.kw.shunbullet
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
 	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
   
	public class MainEntry extends Sprite
	{
		/* variable declaration */
		private var _bullets:Vector.<MovieClip > ;

		private var _stgHalfHeight:Number;
		// constant
		private static const G:Number = 0.8;
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
				var bullet:MovieClip = new Bullet_mc;
				bullet.cacheAsBitmap = true;
				var bul_ang:Number = Math.random()*360;
				bullet.x = STG_W/2 + BULLET_INIT_R*Math.cos(bul_ang);
				bullet.y = STG_H/2 + BULLET_INIT_R*Math.sin(bul_ang);
				/*
				var bul_pos:Number = Math.random()*2*(STG_W + STG_H);
				if (bul_pos > (2*STG_W + STG_H)) {
					bullet.x = 0;
					bullet.y = STG_H - (bul_pos - (2*STG_W + STG_H));
				} else if (bul_pos > (STG_W + STG_H)) {
					bullet.x = STG_W - (bul_pos - (STG_W + STG_H));
					bullet.y = STG_H;
				} else if (bul_pos > STG_W) {
					bullet.x = STG_W;
					bullet.y = bul_pos - STG_W;
				} else {
					bullet.x = bul_pos;
					bullet.y = 0;
				}*/
				_bullets[i] = bullet;
				addChild(bullet);
			}
			trace("MainEntry");
		}
	}
}