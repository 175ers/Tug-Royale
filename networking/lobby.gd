extends Control

const DEFAULT_IP = '127.0.0.1'
var _player_name = ""
var _ip = ""
var _team = ""

func _ready():
	# Called every time the node is added to the scene.
	network.connect("connection_failed", self, "_on_connection_failed")
	network.connect("connection_succeeded", self, "_on_connection_success")
	network.connect("player_list_changed", self, "refresh_lobby")
	network.connect("game_ended", self, "_on_game_ended")
	network.connect("game_error", self, "_on_game_error")

func _on_TextField_text_changed(new_text):
    _player_name = new_text

func _on_create_pressed():
    #Nothing happens when you enter blank name
    if _player_name = "":
        return
    #Start server in network
    network.start_server(_player_name)
    refresh_lobby()
    load_game()

func _on_connect_pressed():
    on_join_pressed()

func _on__join_pressed():
    if _player_name = "" or _ip = "" or _team = "":
        return
    elif _ip == DEFAULT_IP:
        network.join_server(_player_name, _ip, _team)
        load_game()


func load_game():
    get_tree().change_scene('res://playScene.tscn')