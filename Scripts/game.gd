extends Node2D


# Declare member variables here. Examples:
var stage = 0 #how far through the game
var numStages = 9
var nextGroup = load("res://Scenes/Enemies/Groups/Group0.tscn")
var boss = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.reset()
	populateSpawnbutton()
	$LevelTimer.wait_time = 4
	$LevelTimer.start()

func _process(delta):
	updateHud()

func _advance_stage():
	stage = stage + 1
	var group = nextGroup.instance()
	add_child(group)
	if stage < numStages:
		load_next_group()
		if stage > 5:
			$LevelTimer.wait_time = 15
		else:
			$LevelTimer.wait_time = 6
		$LevelTimer.start()
	else:
		$Timer.start()

func load_next_group():
	nextGroup = load("res://Scenes/Enemies/Groups/Group%d.tscn" % [stage])

func beginBoss():
	boss = 1
	$BossAnimationPlayer.play("Enter")
	$BossMoveTimer.wait_time = 5
	$BossMoveTimer.start()
	$Boss.activate()

func updateHud():
	$HUD/DevHUD/State.text = str(PlayerVariables.state)
	$HUD/DevHUD/Score.text = str(PlayerVariables.score)
	$HUD/DevHUD/Life.text = str(PlayerVariables.life)
	$HUD/DevHUD/Bomb.text = str(PlayerVariables.bomb)
	$HUD/DevHUD/Power.text = str(PlayerVariables.power)
	$HUD/DevHUD/Courage.text = str(PlayerVariables.courage)
	$HUD/DevHUD/Pickup.text = str(PlayerVariables.pickup)
	$HUD/DevHUD/FpsCounter.text = str(Engine.get_frames_per_second())
	

func populateSpawnbutton():
	var popup = $HUD/DevHUD/SpawnButton.get_popup()
	for _i in range(0,numStages):
		popup.add_item("Group %d" % [_i])
	
	popup.connect("id_pressed",self,"_on_SpawnItem_Pressed")

func _on_SpawnItem_Pressed(id):
	var Group = load("res://Scenes/Enemies/Groups/Group%d.tscn" % [id])
	var group = Group.instance()
	add_child(group)


func _on_PowerUpButton_pressed():
	PlayerVariables.updatePower(PlayerVariables.power + 1)


func _on_PowerDownButton_pressed():
	PlayerVariables.updatePower(PlayerVariables.power - 1)


func _on_InvButton_toggled(button_pressed):
	if button_pressed:
		PlayerVariables.updateState(1)
	else:
		PlayerVariables.updateState(0)


func _on_HitboxButton_toggled(button_pressed):
	if button_pressed:
		$Player/CollisionSprites.show()
	else:
		$Player/CollisionSprites.hide()


func _on_LifeDownButton_pressed():
	PlayerVariables.life = PlayerVariables.life - 1


func _on_LifeUpButton_pressed():
	PlayerVariables.life = PlayerVariables.life + 1


func _on_BombDownButton_pressed():
	PlayerVariables.bomb = PlayerVariables.bomb - 1


func _on_BombUpButton_pressed():
	PlayerVariables.bomb = PlayerVariables.bomb + 1


func _on_MenuButton_pressed():
	Global.badEnd()


func _on_BossMoveTimer_timeout():
	$Boss.move()
	$BossMoveTimer.wait_time = 10
	$BossMoveTimer.start()


func _on_Timer_timeout():
	beginBoss()
