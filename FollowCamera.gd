extends Camera3D

@export var camera_target: Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = camera_target.position + Vector3(-10,10,-10)
	look_at(camera_target.position) 
