extends CharacterBody2D

@onready var sprites = [$Default, $Blue, $Red]

const GRAVITY = 1000
const JUMP_FORCE = -270

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	position += velocity * delta
	
	rotation_degrees = clamp(velocity.y * 0.1, -30, 90)

	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_FORCE
		rotation_degrees = -30

func _ready() -> void:
	randomize_skin()

func randomize_skin():
	var index = randi() % sprites.size()
	for i in sprites.size():
		sprites[i].visible = (i == index)
