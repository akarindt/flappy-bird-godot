extends Node

@onready var score_label: Label = $ScoreLabel
@onready var animation_player: AnimationPlayer = $"%AnimationPlayer"
@onready var main_menu: Sprite2D = %MainMenu
@onready var scoreboard: Node2D = %Scoreboard
@onready var best_score_label: Label = %BestScoreLabel
@onready var score_label_bottom: Label = %ScoreLabelBottom

var start_game = false
var is_dead = false
var score = 0;
var high_score = 0

const SAVE_PATH = "user://high_score.save"

func _ready() -> void:
	load_high_score()
	best_score_label.text = str(high_score)
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		set_status(true)

func _process(delta: float) -> void:
	score_label.visible = start_game && !is_dead
	main_menu.visible = !start_game && !is_dead
	scoreboard.visible = is_dead

func add_point() -> void:
	score += 1
	if high_score == 0:
		best_score_label.text = str(high_score)
	score_label.text = str(score)
	score_label_bottom.text = str(score)
	try_set_new_score(score)

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
	
func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_32(high_score)
	file.close()

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_32()
		file.close()
	else:
		high_score = 0
		
func try_set_new_score(score: int):
	if score > high_score:
		high_score = score
		save_high_score()
