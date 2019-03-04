extends TouchScreenButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var team = 1
onready var n = get_tree().get_root().get_child(0)


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if n == null:
		n = get_tree().get_root().find_node("Network")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Create_Lobby_pressed():
	n.create_server(team)
	get_tree().change_scene('res://playScreen.tscn')
	pass # replace with function body


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		team = 2
	else:
		team = 1
	pass # replace with function body
