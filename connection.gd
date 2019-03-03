extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var status = "disconnected"
var team = 0
var clients = []

const SERVER_PORT = 12452
const MAX_PLAYERS = 36
var SEVRER_IP = '1.1.1.1'

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func init_client():
	status = "client"
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().set_network_peer(peer)
	pass
	
func init_network():
	status = "host"
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	pass
	
func rope_listen():
	#update rope on screen
	pass
	
func pull_rope():
	if status == "client":
		#make request to server to pull rope
		pass
	else:
		# you are the host
		pass
	pass
	
func end_listen(winning_team):
	if winning_team == self.team:
		pass
	else:
		pass
	pass
	
func announce_end():
	#for client in clients.... announce win
	pass
	
func announce_rope():
	#for client in clients.... announce rope status
	pass