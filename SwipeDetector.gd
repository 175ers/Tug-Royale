extends Node

signal swiped(direction)
signal swiped_at(direction, position)
signal swipe_canceled(start_position)

export(float, 1.0, 1.5) var MAX_DIAGONAL_SLOPE = 1.3

onready var timer = $Timer
var swipe_start_position = Vector2()

func _input(event):
	if not event is InputEventScreenTouch:
		return
	if event.pressed:
		_start_detection(event.position)
	elif not timer.is_stopped():
		_end_detection(event.position)
		
func _start_detection(position):
	swipe_start_position = position
	timer.start()
	
func _end_detection(position):
	timer.stop()
	var direction = (position - swipe_start_position)
	var dirNormal = direction.normalized()
	if abs(dirNormal.x) + abs(dirNormal.y) >= MAX_DIAGONAL_SLOPE:
		return
		
	if abs(direction.x) > abs(direction.y):
		emit_signal('swiped', Vector2(-(direction.x), 0.0))
		emit_signal('swiped_at', Vector2(-(direction.x), 0.0), swipe_start_position)
	else:
		emit_signal('swiped', Vector2(0.0, -(direction.y)))
		emit_signal('swiped_at', Vector2(0.0, -(direction.y)), swipe_start_position)
	
		
func _on_Timer_timeout():
	emit_signal('swipe_canceled', swipe_start_position)
	pass # replace with function body
