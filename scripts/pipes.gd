extends StaticBody2D

const PIPE_SPEED = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= PIPE_SPEED * delta
	if position.x < -PIPE_SPEED:
		print("Disposed")
		queue_free()
