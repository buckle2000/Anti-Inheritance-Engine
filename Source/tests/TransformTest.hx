package tests;

import core.Transform;
import flash.geom.Point;
import motion.Actuate;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;


class TransformTest extends Sprite {
	var a:Transform;
	var b:Transform;
	var c:Transform;
	
	public function new () {
		super();
		addEventListener(Event.ENTER_FRAME, et);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, kd);
		a = new Transform();
		b = new Transform();
		c = new Transform();
		a.localPosition.setTo(stage.stageWidth/2, stage.stageHeight/2);
		b.localPosition.setTo(100, 100);
		c.localPosition.setTo(100, 100);
		b.parent = a;
		c.parent = b;
	}
	
	function kd(e:KeyboardEvent) {
		if (e.keyCode==Keyboard.A)
		Actuate.tween(a.localScale, 2, {x:a.localScale.x + 0.5});
		else if (e.keyCode==Keyboard.S){
		Actuate.tween(a, 2, {localRotation:a.localRotation + 1});
		Actuate.tween(b, 2, {localRotation:b.localRotation + 1});
		} else if (e.keyCode == Keyboard.Z)
		Actuate.tween(a.localScale, 2, {x:a.localScale.x - 0.5});
		
		//Actuate.tween(b, 2, {localRotation:b.localRotation+1});
	}
	
	function et(e:Event)
	{
		graphics.clear();
		graphics.beginFill(0xffff3333); //red grey A
		graphics.lineStyle(2, 0xffff3333);
		var ap = a.position;
		graphics.moveTo(ap.x, ap.y);
		graphics.lineTo(ap.x + Math.cos(a.rotation) * 100, ap.y + -Math.sin(a.rotation) * 100);
		graphics.lineStyle();
		graphics.drawCircle(ap.x, ap.y, 10);
		graphics.beginFill(0xff3333ff); //blue B
		ap = b.position;
		graphics.drawCircle(ap.x, ap.y, 10);
		ap = c.position;
		graphics.beginFill(0xff33ff33); // yellow C
		graphics.drawCircle(ap.x, ap.y, 10);
	}
}