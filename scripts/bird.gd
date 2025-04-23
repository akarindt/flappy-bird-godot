extends CharacterBody2D

@onready var sprites = [$Default, $Blue, $Red]

func _ready() -> void:
	randomize_skin()

func randomize_skin():
	var index = randi() % sprites.size()
	for i in sprites.size():
		sprites[i].visible = (i == index)
