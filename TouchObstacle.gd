extends TouchScreenButton
extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('right'):
        velocity.x += 1
    if Input.is_action_pressed('left'):
        velocity.x -= 1
    if Input.is_action_pressed('down'):
        velocity.y += 1
    if Input.is_action_pressed('up'):
        velocity.y -= 1
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    move_and_slide(velocity)

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
bool pressed
func is_pressed():
	pressed = true
	
	

var coord
func getNode(name):
	get_parent().get_parent().find_node(name)
	coord = name.get_pos() 
	print (coord)
	
	
	
	


