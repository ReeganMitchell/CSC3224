extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxLayer.motion_offset.y += 0.2
	$ParallaxLayer2.motion_offset.y += 0.4
	$ParallaxLayer3.motion_offset.y += 0.6

