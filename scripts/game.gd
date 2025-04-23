extends Node2D

const SPEED = 75.0
const TEXTURE_WIDTH = 530.0

@onready var camera_2d: Camera2D = $Camera2D

@onready var backgrounds = [$BG/BG1, $BG/BG2]
@onready var bases = [$Base/Base, $Base/Base2]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for bg in backgrounds:
		bg.position.x -= SPEED * delta
		if bg.position.x <= -TEXTURE_WIDTH:
			bg.position.x += TEXTURE_WIDTH * 2
			
	for base in bases:
		base.position.x -= SPEED * delta
		if base.position.x <= -TEXTURE_WIDTH:
			base.position.x += TEXTURE_WIDTH * 2
