extends Node3D

var mouse_sensitivity = 0.002
const RAY_LENGTH = 20000

@export var player : Node3D
@export var camera : Camera3D
@export var offset : Vector3

var bullet : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet = preload("res://scenes/bullet.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position + offset


func _input(event):
	if (event is InputEventMouseMotion || event is InputEventMouseButton):
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
			var direction = hit_pos + Vector3(0, 1, 0) - ballpos
			look_at(hit_pos)
			if (event is InputEventMouseButton):
				shoot(direction)

func shoot(dir: Vector3):
	var instance = bullet.instantiate() as RigidBody3D
	instance.global_position = player.global_position
	instance.linear_velocity = dir
	get_tree().root.add_child(instance)
