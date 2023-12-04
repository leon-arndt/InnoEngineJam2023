extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 3.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var is_blocked = (next_location - current_location).length() < 0.2
	var new_velocity = (next_location - current_location).normalized() * SPEED
	velocity = new_velocity
	
	# if enemy is blocked, don't move to avoid "shivering"
	if is_blocked:
		velocity = velocity * 0
	
	move_and_slide()
 
func update_target_location(target_location):
	nav_agent.target_position = target_location
