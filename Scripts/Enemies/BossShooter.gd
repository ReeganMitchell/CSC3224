extends Node2D


var noBullets = 0
var noShots = 0
var shots
var startAngle = 0
var seperation = 0
var Bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	Bullet = chooseBullet()
	position = find_parent("Game").get_node("Boss").position
	noBullets = Global.rng.randi_range(1,10)
	var difference = 0
	var player = get_tree().get_nodes_in_group("Player")
	startAngle = rad2deg(get_angle_to(player[0].position)) + Global.rng.randi_range(-45,45)
	seperation = Global.rng.randi_range(20,60)
	noShots = Global.rng.randi_range(1,15)
	
	readyShot()

func chooseBullet():
	var bul = Global.rng.randi_range(0,2)
	return load("res://Scenes/Enemies/Bullets/Bullet%d.tscn" % [bul])

func readyShot():
	$shootTimer.wait_time = Global.rng.randf_range(2,4)
	$shootTimer.start()
	shots = noShots

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
		$burstTimer.start()
	else: 
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = find_parent("Game").get_node("Boss").position
