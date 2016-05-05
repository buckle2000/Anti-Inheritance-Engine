package core;
import openfl.geom.Point;
import eskimo.Entity;

class Transform {
	public var localPosition:Point;
	public var localScale:Point;
	public var localRotation:Float;
	
	public var parent:Transform;
	public var position(get_position, null):Point;
	public var rotation(get_rotation, null):Float;
	public var lossyScale(get_lossyScale, null):Point;

	public var entity(default, null):Entity;

	public function new() {
		localPosition = new Point(0, 0);
		localScale = new Point(1, 1);
		localRotation = 0;
		parent = null;
	}
	
	//TODO 增加一个功能给entity加上transform

	// this will NOT change `entity`

	public function clone():Transform {
		var result = new Transform();
		result.entity = entity;
		result.localPosition = localPosition;
		result.localScale = localScale;
		result.localRotation = localRotation;
		return result;
	}

	public function copyFrom(other:Transform) {
		localPosition = other.localPosition;
		localScale = other.localScale;
		localRotation = other.localRotation;
	}

	function get_position() {
		if (parent == null)
			return localPosition;
		else {
			return getWorldPosition(localPosition);
		}
	}
	
	public function getWorldPosition(pos:Point) {
		if (parent == null)
			return pos;
		else {
			var cos = Math.cos(parent.localRotation);
			var sin = Math.sin(parent.localRotation);
			var scaled = new Point(pos.x * parent.localScale.x, pos.y * parent.localScale.y);
			return parent.getWorldPosition(parent.localPosition.add(new Point(scaled.x * cos + scaled.y * sin, scaled.y * cos - scaled.x * sin)));
		}
	}

	function get_rotation() {
		if (parent == null)
			return localRotation;
		else
			return localRotation + parent.rotation;
	}
	
	function get_lossyScale() {
		if (parent == null)
			return localScale;
		else {
			return localScale; //TODO implement this
		}
	}
}
