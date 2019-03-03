extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
	


onready var y = self.position.y
onready var x = self.position.x
var speed = 200

var velocity = Vector2()

var isPressedOrNot

func _pressDetector():
	isPressedOrNot = is_pressed()
	if isPressedOrNot == true:
		speed = 0.0
		self.translate(Vector2(0.0, speed))
	else:
		self.translate(Vector2(0.0, speed))


	
	#if pos.x < 0:
		#velocity.x = 2.0
	#else:
		#velocity = 0.0



	
	
	
	


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass




