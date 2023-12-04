extends Button

@export var parentNode : Node
@export var playerNode : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	parentNode.visible = false
	playerNode.connect("health_depleted", _on_health_depleted)
	pressed.connect(_on_button_down)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_health_depleted():
	parentNode.visible = true
	pass

func _on_button_down():
	get_tree().reload_current_scene()
