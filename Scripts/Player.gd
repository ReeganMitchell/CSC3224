extends Area2D

var pos = Vector2()
var state = 0 #0 = normal, 1 = invincible, 2 = cutscene
var speed = 250
var velocity = Vector2()
var mult = 1

var Bullet
var Bomb
var noBullets = 1
var seperation = 0
var cooldown = 0.5
var shootReady = true
var bombReady = true


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	connect_signals()
	state = 2
	setPower()
	Bullet = load("res://Scenes/PlayerBullet.tscn")
	Bomb = load("res://Scenes/Bomb.tscn")
	start()

func connect_signals():
	PlayerVariables.connect("power_change",self,"setPower")
	PlayerVariables.connect("state_change",self,"setState")

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
			cooldown = 0.4
		2:
			noBullets = 2
			seperation = 8
			cooldown = 0.35
		3:
			noBullets = 3
			seperation = 12
			cooldown = 0.3
		4:
			noBullets = 4
			seperation = 16
			cooldown = 0.25
		5:
			noBullets = 5
			seperation = 20
			cooldown = 0.2

func setState():
	state = PlayerVariables.state
	match state:
		0:
			modulate.a = 1
		1:
			modulate.a = 0.5
		2:
			modulate.a = 1

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
		bullet.velocity = Vector2(400,0)
		bullet.velocity = bullet.velocity.rotated(deg2rad(startAngle + (i * difference)))
	
	shootReady = false
	$LaserSound.play()
	$CooldownTimer.wait_time = cooldown
	$CooldownTimer.start()

func bomb():
	if PlayerVariables.bomb > 0:
		PlayerVariables.bomb -= 1
		PlayerVariables.updateState(1)
		var bomb = Bomb.instance()
		add_child(bomb)
		$BombTimer.wait_time = 3
		$BombTimer.start()
		bombReady = false

func _physics_process(delta):
	movement()
	mult = 1
	if Input.is_key_pressed(KEY_SHIFT):
		mult = 0.5
	
	position += velocity  * mult * delta
	position.x = clamp(position.x, 5, 395)
	position.y = clamp(position.y, 5, 395)
	
	
	if Input.is_key_pressed(KEY_Z):
		if shootReady:
			shoot()
	
	if Input.is_key_pressed(KEY_X):
		if bombReady:
			bomb()

func _on_CooldownTimer_timeout():
	shootReady = true


func _on_Courage_area_entered(area):
	var groupArray = area.get_groups()
	for _i in groupArray:
		if _i == "enemy":
			PlayerVariables.courage = PlayerVariables.courage + 1
		if _i == "scorePickup":
			PlayerVariables.score += 10
			PlayerVariables.pickup +=1
			area.queue_free()
		if _i == "powerPickup":
			PlayerVariables.pickup +=1
			PlayerVariables.updatePower(PlayerVariables.power + 1)
			area.queue_free()


func _on_BombTimer_timeout():
	bombReady = true
	var bombs = get_tree().get_nodes_in_group("Bomb")
	
	for _i in bombs:
		_i.queue_free()
	
	PlayerVariables.updateState(0)
