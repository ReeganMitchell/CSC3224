extends KinematicBody2D

var pos = Vector2()
var state = 0 #0 = normal, 1 = invincible, 2 = cutscene
var speed = 150
var velocity = Vector2()
var mult = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	state = 2
	start()

func start():
	state = 0

func movement():
	velocity = Vector2()
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += 1
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed

func check_bounds():
	pos = get_position()
	if pos.x > 395:
		pos.x = 395
	if pos.x < 5:
		pos.x = 5
	if pos.y > 395:
		pos.y = 395
	if pos.y < 5:
		pos.y = 5
	set_position(pos)


func _physics_process(delta):
	movement()
	mult = 1
	if Input.is_key_pressed(KEY_SHIFT):
		mult = 0.5
	velocity = move_and_slide(velocity * mult)
	check_bounds()
