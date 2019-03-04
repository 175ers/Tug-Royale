extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var target_y = self.position.y
var speed = 200
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if target_y > self.position.y:
			self.translate(Vector2(0.0, speed * delta))
	elif target_y < self.position.y:
			self.translate(Vector2(0.0, -speed * delta))

	#print  (str(target_y) + " " + str(self.position.y))
	
	pass


func _on_SwipeDetector_swiped(direction):
	if direction.y < 0:
		target_y -= direction.y / 5
	pass # replace with function body

