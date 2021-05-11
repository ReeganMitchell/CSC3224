extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.calcScore()
	$FinalScore.text = str(Global.finalScore)
	$Score.text = str(PlayerVariables.score)
	$Pickup.text = str(PlayerVariables.pickup)
	$Courage.text = str(PlayerVariables.courage)
	$Mult.text = str(Global.scoremult)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MenuButton_pressed():
	Global.badEnd()
