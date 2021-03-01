extends Area2D


# Declare member variables here. Examples:
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("PlayerBullet")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta


func _on_screen_exited():
	queue_free()
