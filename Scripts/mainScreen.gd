extends Node


# Declare member variables here
var state = 0 #0 = menu, 1 = how to, 2 = game
onready var animplayer = $MenuAnimPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	state = 0
	animplayer.play_backwards("StartGame")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	if (state == 0 ):
		animplayer.play("StartGame")
		state = 2
		Global.goto_scene("res://Scenes/game.tscn")



func _on_How2Button_pressed():
	if (state == 0):
		animplayer.play("HowToPlay")
		state = 1



func _on_Button_pressed():
	if (state == 1):
		animplayer.play_backwards("HowToPlay")
		state = 0
