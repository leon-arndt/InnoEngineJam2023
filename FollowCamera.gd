extends Camera3D

@export var camera_target: Node
@export var camera_offset: Vector3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = camera_target.position + camera_offset

