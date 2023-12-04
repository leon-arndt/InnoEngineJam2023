extends Area3D

signal win

func _ready():
	pass


func _process(delta):
	pass

func _on_body_entered(body : Node3D):
	if body.is_in_group("Player"):
		finish_level()

func finish_level():
	print("you win!")
	emit_signal("win")
