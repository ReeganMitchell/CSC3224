extends Area2D

var startSpeed = 40
var inc = 0.5
var endSpeed = -50
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = startSpeed
	add_to_group("powerPickup")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if velocity.y > endSpeed:
		velocity.y = velocity.y - inc
	
	position -= velocity * delta


func _on_screen_exited():
	queue_free()
