package core;
import eskimo.Entity;

// If you see this, do not use this class anymore.

class GameObject extends Entity {
	public var transform(default, null):Transform;

	public function new(generateTransform:Bool = true) {
		// TODO 放弃？
		if (generateTransform)
			newTransform();
	}

	public function newTransform(reserve:Bool = false):Transform {
		var old = transform;
		if (reserve)
			transform = old.clone();
		else
			transform = new Transform(this);
		return old;
	}
	
	public inline function setParent(parent:GameObject) {
		
		this.transform.parent = parent.transform;
	}
}
