extends Node


# Declare member variables here. Examples:
var life = 5
var bomb = 3
var power = 1
var score = 0
var pickup = 0
var courage = 0

signal power_change

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updatePower():
	emit_signal("power_change")
