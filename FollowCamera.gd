extends Camera3D

@export var camera_target: Node
@export var camera_offset: Vector3
var follow = true
# Called when the node enters the scene tree for the first time.
func _ready():
	camera_target.connect("health_depleted", _on_health_depleted)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if follow:
		position = camera_target.position + camera_offset

func _on_health_depleted():
	follow = false
	pass
