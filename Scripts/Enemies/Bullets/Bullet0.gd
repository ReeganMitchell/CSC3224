extends Area2D

var velocity = Vector2()


func _ready():
	add_to_group("enemy")


func _physics_process(delta):
	position += velocity * delta


func _on_screen_exited():
	queue_free()


func _on_Bullet0_area_entered(area):
	var groupArray = area.get_groups()
	for _i in groupArray:
		if _i == "Player":
			PlayerVariables.hit()
			queue_free()
		if _i == "Bomb":
			queue_free()

