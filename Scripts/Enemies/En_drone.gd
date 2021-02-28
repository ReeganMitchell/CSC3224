extends KinematicBody2D


# Declare member variables here. Examples:
var direction = 90
var speed = 40


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2(speed,0)
	velocity = velocity.rotated(deg2rad(direction))
	position += velocity * delta


func _on_screen_exited():
	queue_free()
