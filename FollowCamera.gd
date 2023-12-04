extends Camera3D

var camera_target

# Called when the node enters the scene tree for the first time.
func _ready():
	camera_target = get_node("/root/Node3D/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = camera_target.position + Vector3(-10,10,-10)
	look_at(camera_target.position) 
