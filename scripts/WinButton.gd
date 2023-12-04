extends Button

@export var parentNode : Node
@export var levelFinish : Node

func _ready():
	parentNode.visible = false
	levelFinish.connect("win", _on_win)
	pressed.connect(_on_button_down)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_win():
	print("on-win")
	parentNode.visible = true
	pass

func _on_button_down():
	print("on-button-down")
	get_tree().reload_current_scene()
