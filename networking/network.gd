extends Node

const DEFAULT_IP = '127.0.0.1'
const DEFAULT_PORT = 31416
const MAX_PEERS = 10
var players = {}
var player_status

#Signals to Lobby
signal player_list_changed()
signal connection_failed()
signal connection_succeeded()
signal game_ended()
signal game_error(what)

func _ready():
	# Called when the node is added to the scene for the first time.
	# High Level Networking Initialization here
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connection_ready")
	get_tree().connect("connection_failed", self, "_connection_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnect")

# Start a server
func start_server(name):
	player_status = name
	var host = NetworkedMultiplayerENet.new()
	var server = host.create_server(DEFAULT_PORT, MAX_PEERS)

	# if(server != ok): # If server doesnt start, join a server with IP
	# 	join_server()
	# 	return

	get_tree.set_network_peer(host)

# Join a server with specifc IP
func join_server(name, ip_address):
	player_status = name
	var host = NetworkedMultiplayerENet.new()

	host.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(host)

# Player has connected
func _player_connected(id):
	pass

func _player_disconnected(id):
	if(get_tree().is_network_server()):
		if has_node("/root/world"):
			emit_signal("game_error", "Player " + players[id] + " disconnected")
			end_game()
		else:
			players.erase(id)
			emit_signal("player_list_changed")
	
# Successfully connected to server (client)
func _connected_ready():
	# Send signal to server that we are ready to be assigned;
	# Either to lobby or ingame
	rpc_id(1, "user_ready", get_tree().get_network_unique_id(), player_name)
	pass

#func _connected_fail():


func _server_disconnect():
	quit_game()	
	
func quit_game():
	get_tree().set_network_peer(null)
	players.clear()



