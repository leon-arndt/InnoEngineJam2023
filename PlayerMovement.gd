extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var forward = Input.get_action_strength("move_forward")
	var backward = Input.get_action_strength("move_backward")
	var left = Input.get_action_strength("move_left")
	var right = Input.get_action_strength("move_right")
	var direction = Vector3(left-right, 0, forward-backward)
	apply_central_force(direction * 800 * delta)
