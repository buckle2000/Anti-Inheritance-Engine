package;

import core.RenderComponent;
import core.SpriteRenderComponent;
import eskimo.Context;
import eskimo.Entity;
import eskimo.View;
import flash.display.Graphics;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

class Main extends Sprite {
	
	public function new () {
		super();
		var a = new SpriteRenderComponent();
		var g:Graphics = a.target.graphics;
		g.lineStyle(2, 0xffff3333);
		g.moveTo(0, 0);
		g.lineTo(100, 100);
		var c = new Context();
		var e:Entity = c.entities.create();
		e.set(cast (a,RenderComponent));
		trace(e.get(RenderComponent));
		var b = new BitmapData(1000, 1000);
		var v:View = new View([RenderComponent]);
		v.initialize(c);
		for (l in v.entities) {
			var d = l.get(RenderComponent);
			b.draw(d.getDrawable());
		}
		addChild(new Bitmap(b));
	}
}
