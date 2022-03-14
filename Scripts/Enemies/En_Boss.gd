extends Area2D


var score = 5000
var health = 60
var stage = 0
var pos = 0
var animPlayer
var laser
var shooter


# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer = find_parent("Game").get_node("BossAnimationPlayer")
	laser = load("res://Scenes/Enemies/Bullets/Laser0.tscn")
	shooter = load("res://Scenes/Enemies/BossShooter.tscn")
	add_to_group("enemy")

func activate():
	if (stage == 0):
		$ShootTimer.wait_time = Global.rng.randi_range(2, 4)
		$ShootTimer.start()
		stage = 1

func _process(delta):
	$Shield.rotate(0.01)

func laser():
	var next = Global.rng.randi_range(1,2)
	if (next == 1):
		laserLeft()
	else:
		laserRight()

func laserLeft():
	find_parent("Game").add_child(laser)

func laserRight():
	find_parent("Game").add_child(laser)

func shoot():
	if (stage == 1):
		find_parent("Game").add_child(shooter.instance())
		$ShootTimer.wait_time = Global.rng.randi_range(2, 4)
		$ShootTimer.start()

func move():
	if (pos == 0):
		var next = Global.rng.randi_range(1,2)
		if (next == 1):
			animPlayer.play("Middle->Left")
			pos = 1
		else:
			animPlayer.play("Middle->Right")
			pos = 2
	elif (pos == 1):
		animPlayer.play_backwards("Middle->Left")
		pos = 0
	else:
		animPlayer.play_backwards("Middle->Right")
		pos = 0


func _on_Boss_area_entered(area):
	var groupArray = area.get_groups()
	for _i in groupArray:
		if _i == "PlayerBullet":
			area.queue_free()
			if health > 0:
				health -= 1
			else:
				if (stage != -1):
					die()
		if _i == "Player":
			PlayerVariables.hit()
			die()
		if _i == "Bomb":
			pass

func die():
	PlayerVariables.score = PlayerVariables.score + score
	stage = -1
	$EndTimer.wait_time = 5
	$EndTimer.start()


func _on_EndTimer_timeout():
	Global.goodEnd()
