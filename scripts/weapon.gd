extends Node3D

var mouse_sensitivity = 0.002
const RAY_LENGTH = 20000

@export var player : Node3D
@export var camera : Camera3D
@export var offset : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED # should be moved to main class
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position + offset


func _input(event):
	if (event is InputEventMouseMotion):
		var mousepos = get_viewport().get_mouse_position()
		var ballpos = player.global_position
		
		var space_state = get_world_3d().direct_space_state
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * RAY_LENGTH
		# use global coordinates, not local to node
		var query = PhysicsRayQueryParameters3D.create(from, to)
		var result = space_state.intersect_ray(query)
		if result.has("position"): # if we hit something
			var hit_pos = result.position
			var direction = ballpos - hit_pos
			print(result)
			look_at(hit_pos)

		#shoot(direction)

func shoot(dir: Vector3):
	#var space : PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	#var query = PhysicsRayQueryParameters3D.create(position, at)
	#var collision = space.intersect_ray(query)
	#if collision:
		#print(collision.collider.name)
	print("foo")
