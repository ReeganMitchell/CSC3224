extends Area2D

var pos = Vector2()
var state = 0 #0 = normal, 1 = invincible, 2 = cutscene
var speed = 150
var velocity = Vector2()
var mult = 1

var Bullet
var noBullets = 1
var seperation = 0
var cooldown = 0.5
var shootReady = true


# Called when the node enters the scene tree for the first time.
func _ready():
	state = 2
	setPower()
	Bullet = load("res://Scenes/PlayerBullet.tscn")
	start()

func connect_signals():
	Global.connect("power_change",PlayerVariables,"setPower")

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

func setPower():
	match PlayerVariables.power:
		1:
			noBullets = 1
			seperation = 0
			cooldown = 0.5
		2:
			noBullets = 2
			seperation = 8
			cooldown = 0.4
		3:
			noBullets = 3
			seperation = 12
			cooldown = 0.3
		4:
			noBullets = 4
			seperation = 16
			cooldown = 0.2
		5:
			noBullets = 5
			seperation = 20
			cooldown = 0.1

func shoot():
	var difference = 0
	var startAngle = 270
	if noBullets > 1:
		startAngle = 270 - (seperation/2)
		difference = seperation / (noBullets - 1)
		
	for i in range(0,noBullets):
		var bullet = Bullet.instance()
		find_parent("Game").add_child(bullet)
		bullet.position = self.position
		bullet.velocity = Vector2(250,0)
		bullet.velocity = bullet.velocity.rotated(deg2rad(startAngle + (i * difference)))
	
	shootReady = false
	$CooldownTimer.wait_time = cooldown
	$CooldownTimer.start()

func _physics_process(delta):
	movement()
	mult = 1
	if Input.is_key_pressed(KEY_SHIFT):
		mult = 0.5
	
	position += velocity * delta
	position.x = clamp(position.x, 5, 395)
	position.y = clamp(position.y, 5, 395)
	
	if Input.is_key_pressed(KEY_Z):
		if shootReady:
			shoot()


func _on_CooldownTimer_timeout():
	shootReady = true
