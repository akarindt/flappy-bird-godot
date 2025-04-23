extends Node

@onready var timer: Timer = $Timer

var PIPE_SCENE: PackedScene = load("res://scenes/pipes.tscn")
var SPAWN_INTERVAL = 1.8
var PIPE_Y_RANGE = Vector2(-575, -420)

const PIPE_SPEED = 100.0
const PIPE_START_X = 500

func _ready() -> void:
	timer.wait_time = SPAWN_INTERVAL
	timer.start()
	
func spawn_pipe() -> void: 
	var pipe = PIPE_SCENE.instantiate()
	pipe.position = Vector2(PIPE_START_X, randf_range(PIPE_Y_RANGE.x, PIPE_Y_RANGE.y))
	add_child(pipe)
	

func _on_timer_timeout() -> void:
	spawn_pipe()
