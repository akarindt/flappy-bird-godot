extends Node2D

@onready var sprite_day: Sprite2D = $SpriteDay
@onready var sprite_night: Sprite2D = $SpriteNight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_day_night()

func check_day_night() -> void:
	var current_hour = Time.get_datetime_dict_from_system().hour
	var check = (current_hour >= 6 and current_hour < 18)
	sprite_day.visible = check
	sprite_night.visible = !check
