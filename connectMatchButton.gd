extends TouchScreenButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var team = 1
onready var n = get_tree().get_root().get_child(0)
	
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_TouchScreenButton_pressed():
	n.connect_to_server(team)
	get_tree().change_scene('res://playScreen.tscn')
	pass # replace with function body
