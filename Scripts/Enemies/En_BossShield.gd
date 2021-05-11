extends Area2D

var score = 200
var health = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func create_pickup(pickup):
	find_parent("Game").add_child(pickup)
	pickup.position = self.global_position


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


func _on_BossShield_area_entered(area):
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
			pass
