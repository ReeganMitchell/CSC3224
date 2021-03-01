extends Area2D


var direction = 90
var speed = 80
var score = 10

func _ready():
	add_to_group("enemy")


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

func _on_En_drone_area_entered(area):
	var groupArray = area.get_groups()
	for _i in groupArray:
		if _i == "PlayerBullet":
			area.queue_free()
			die()
		if _i == "Player":
			PlayerVariables.hit()
			die()
		if _i == "Bomb":
			die()
