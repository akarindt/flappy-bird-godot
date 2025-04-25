extends StaticBody2D

const PIPE_SPEED = 100.0
var game_manager: Node = null

@onready var point_sound: AudioStreamPlayer2D = $PointSound

@onready var pipes = [[$TopPipe/GreenTop,$BottomPipe/GreenBottom], [$TopPipe/RedTop, $BottomPipe/RedBottom]]

func _ready() -> void:
	var index = randi() % pipes.size()
	for i in pipes.size():
		if (i == index):
			pipes[i][0].visible = true 
			pipes[i][1].visible = true
		else:
			pipes[i][0].visible = false
			pipes[i][1].visible = false

func _process(delta: float) -> void:	
	if !game_manager.check_dead():
		position.x -= PIPE_SPEED * delta
		if position.x < -PIPE_SPEED:
			queue_free()


func _on_pipe_zone_body_entered(body: Node2D) -> void:
	if game_manager != null:
		point_sound.play(0.17)
		game_manager.add_point()
