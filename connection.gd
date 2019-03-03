extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var status = "disconnected"

var clients = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func connect_to_server():
	status = "client"
	pass
	
func host_server():
	status = "host"
	
	pass
	
func rope_listen():
	
	pass
	
func pull_rope():
	if status == "client":
		#make request to server to pull rope
		pass
	else:
		# you are the host
		pass
	pass