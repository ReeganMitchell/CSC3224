extends Node2D


var current_scene = null
var ScorePickup
var PowerPickup
var scoremult = 1
var finalScore = 0
var bestScore = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	rng.randomize()
	ScorePickup = load("res://Scenes/ScorePickup.tscn")
	PowerPickup = load("res://Scenes/PowerPickup.tscn")

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()
	
	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instance()
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)

func goodEnd():
	for _i in PlayerVariables.get_children():
		_i.queue_free()
	
	goto_scene("res://Scenes/Finish.tscn")

func badEnd():
	for _i in PlayerVariables.get_children():
		_i.queue_free()
	goto_scene("res://Scenes/mainScreen.tscn")

func calcScore():
	finalScore = PlayerVariables.score + PlayerVariables.pickup + PlayerVariables.courage
	
	if (finalScore > bestScore):
		bestScore = finalScore
