extends Area2D

var state = 0
var direction = 90
var exit = "left"
var health = 40
var speed = 25
var score = 100
var shots = 20
var delay = 1
var Bullet
var noBullets = 30
var seperation = 360


# Called when the node enters the scene tree for the first time.
func _ready():
	state = 0
	add_to_group("enemy")
	Bullet = load("res://Scenes/Enemies/Bullets/Bullet0.tscn")
	
	if global_position.x < 200:
		exit = "left"
	else:
		exit = "right"


func _physics_process(delta):
	var velocity = Vector2(speed,0)
	velocity = velocity.rotated(deg2rad(direction))
	position += velocity * delta
	
	if global_position.y > 50 && state == 0:
		setState(1)

func setState(newState):
	state = newState
	if newState == 1:
		speed = 0
		readyShot()
		
	if newState == 2:
		speed = 25
		if exit == "left":
			direction = 180
		else:
			direction = 0

func readyShot():
	$ShootTimer.wait_time = delay
	$ShootTimer.start()

func shoot():
	var difference = 0
	var startAngle = rad2deg(0)
	
	if noBullets > 1:
		startAngle = startAngle - (seperation/2)
		difference = seperation / (noBullets - 1)
	
	for i in range(0,noBullets):
		var bullet = Bullet.instance()
		find_parent("Game").add_child(bullet)
		bullet.position = self.global_position
		bullet.velocity = Vector2(90,0)
		bullet.velocity = bullet.velocity.rotated(deg2rad(startAngle + (i * difference)))
	
	shots -= 1
	if shots > 0:
		readyShot()
	else:
		setState(2)

func die():
	PlayerVariables.score = PlayerVariables.score + score
	
	var pickup 
	var num = Global.rng.randi_range(2,10)
	if num == 10:
		pickup = Global.PowerPickup.instance()
		
	else:
		pickup = Global.ScorePickup.instance()
	call_deferred("create_pickup",pickup)
	queue_free()


func _on_En_tank_area_entered(area):
	var groupArray = area.get_groups()
	for _i in groupArray:
		if _i == "PlayerBullet":
			area.queue_free()
			if health > 0:
				health -= 1
			else:
				die()
		if _i == "Player":
			PlayerVariables.hit()
			die()
		if _i == "Bomb":
			die()
