extends TouchScreenButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_Create_a_Match_pressed():
	get_tree().change_scene("res://Create Lobby.tscn")
	pass # replace with function body
