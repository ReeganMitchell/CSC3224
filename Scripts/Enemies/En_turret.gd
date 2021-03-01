extends Area2D

var direction = 90
var health = 5
var speed = 50
var score = 20
var shots = 3
var delay = 1.2
var Bullet
var noBullets = 3
var seperation = 20

func _ready():
	add_to_group("enemy")
	Bullet = load("res://Scenes/Enemies/Bullets/Bullet0.tscn")


func _physics_process(delta):
	var velocity = Vector2(speed,0)
	velocity = velocity.rotated(deg2rad(direction))
	position += velocity * delta

func create_pickup(pickup):
	find_parent("Game").add_child(pickup)
	pickup.position = self.global_position

func _on_screen_exited():
	queue_free()

func die():
	PlayerVariables.score = PlayerVariables.score + score
	
	var pickup 
	var num = Global.rng.randi_range(1,10)
	if num == 10:
		pickup = Global.PowerPickup.instance()
		
	else:
		pickup = Global.ScorePickup.instance()
	call_deferred("create_pickup",pickup)
	queue_free()

func _on_En_turret_area_entered(area):
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

func _on_screen_entered():
	$ShootTimer.wait_time = 3
	$ShootTimer.start()

func readyShot():
	$ShootTimer.wait_time = delay
	$ShootTimer.start()

func shoot():
	var difference = 0
	var player = get_tree().get_nodes_in_group("Player")
	var startAngle = rad2deg(get_angle_to(player[0].position))
	
	if noBullets > 1:
		startAngle = startAngle - (seperation/2)
		difference = seperation / (noBullets - 1)
	
	for i in range(0,noBullets):
		var bullet = Bullet.instance()
		find_parent("Game").add_child(bullet)
		bullet.position = self.global_position
		bullet.velocity = Vector2(80,0)
		bullet.velocity = bullet.velocity.rotated(deg2rad(startAngle + (i * difference)))
	
	shots -= 1
	if shots > 0:
		readyShot()
