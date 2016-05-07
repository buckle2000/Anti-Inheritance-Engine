package core;
import flash.display.IBitmapDrawable;
import openfl.display.Sprite;


class SpriteRenderComponent implements RenderComponent
{	
	public var target:Sprite;
	
	public function new() {
		target = new Sprite();
	}
	
	public function getDrawable():IBitmapDrawable {
		return target;
	}
}