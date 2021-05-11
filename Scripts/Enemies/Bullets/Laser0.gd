extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ClearTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Laser0_area_entered(area):
	var groupArray = area.get_groups()
	for _i in groupArray:
		if _i == "Player":
			PlayerVariables.hit()
			queue_free()
		if _i == "Bomb":
			queue_free()


func _on_ClearTimer_timeout():
	queue_free()
