extends Node

var invincibleTimer 

var state = 0 #0 = normal, 1 = invincible, 2 = cutscene
var life = 5
var bomb = 3
var power = 1
var score = 0
var pickup = 0
var courage = 0

signal power_change
signal state_change

# Called when the node enters the scene tree for the first time.
func _ready():
	invincibleTimer = Timer.new()
	invincibleTimer.one_shot = true
	invincibleTimer.connect("timeout",self,"returnNormalState")
	add_child(invincibleTimer)

func connect_signals(ply):
	Global.connect("power_change",ply,"setPower")
	Global.connect("state_change",ply,"setState")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset():
	state = 0
	life = 5
	bomb = 3
	power = 1
	score = 0
	pickup = 0
	courage = 0

func updatePower(newPower):
	if newPower <= 5 && newPower > 0:
		power = newPower
		emit_signal("power_change")

func updateState(newState):
	state = newState
	emit_signal("state_change")

func returnNormalState():
	updateState(0)

func hit():
	if state == 0:
		if life > 0:
			life = life - 1
			updatePower(power - 1)
			updateState(1)
			invincibleTimer.wait_time = 3
			invincibleTimer.start()
		else:
			Global.badEnd()
