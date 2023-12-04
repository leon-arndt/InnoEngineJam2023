extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta) -> void:
		time += delta
		seconds = fmod(time, 60)
		$SecondsLeft.text = "%02d" % seconds
