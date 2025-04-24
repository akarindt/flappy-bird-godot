extends StaticBody2D

const PIPE_SPEED = 100.0
var game_manager: Node = null

@onready var point_sound: AudioStreamPlayer2D = $PointSound

func _process(delta: float) -> void:	
	position.x -= PIPE_SPEED * delta
	if position.x < -PIPE_SPEED:
		queue_free()


func _on_pipe_zone_body_entered(body: Node2D) -> void:
	if game_manager != null:
		point_sound.play(0.17)
		game_manager.add_point()
