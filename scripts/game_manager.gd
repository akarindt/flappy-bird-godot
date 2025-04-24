extends Node

var score = 0;
@onready var score_label: Label = $ScoreLabel
@onready var animation_player: AnimationPlayer = $"%AnimationPlayer"
@onready var main_menu: Sprite2D = %MainMenu
@onready var scoreboard: Node2D = %Scoreboard

var start_game = false
var is_dead = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		set_status(true)

func _process(delta: float) -> void:
	main_menu.visible = !start_game
	scoreboard.visible = is_dead

func add_point() -> void:
	score += 1;
	score_label.text = str(score)

func play_flash() -> void:
	animation_player.play("new_animation")

func check_start():
	return start_game
	
func check_dead():
	return is_dead

func set_status(status: bool) -> void:
	start_game = status

func set_dead(status: bool):
	is_dead = status
