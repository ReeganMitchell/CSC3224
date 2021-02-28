extends Node2D


# Declare member variables here. Examples:
var stage = 0 #how far through the game
var numStages = 1
var nextGroup = load("res://Scenes/Enemies/Groups/Group0.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$LevelTimer.wait_time = 5
	$LevelTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _advance_stage():
	stage = stage + 1
	var group = nextGroup.instance()
	add_child(group)
	if stage < numStages:
		load_next_group()
		$LevelTimer.wait_time = 10
		$LevelTimer.start()

func load_next_group():
	nextGroup = load("res://Scenes/Enemies/Groups/group%d.tscn" % [stage])
