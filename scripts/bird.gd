extends CharacterBody2D

@onready var sprites = [$Default, $Blue, $Red]

const GRAVITY = 1000
const JUMP_FORCE = -250

var PIPE_NAME = ["BottomPipe", "TopPipe", "Base", "Base2"]

@onready var wing_sound: AudioStreamPlayer2D = $WingSound
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hit_sound: AudioStreamPlayer2D = $HitSound
@onready var game_manager: Node = %GameManager

func _physics_process(delta):
	if game_manager.check_start():
		velocity.y += GRAVITY * delta
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_FORCE
			rotation_degrees = -30
			wing_sound.play()
		else:
			rotation_degrees = clamp(velocity.y * 0.1, -30, 90)
		move_and_slide()
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if PIPE_NAME.has(collision.get_collider().name):
				die()
	else:
		move_and_slide()

func die():
	velocity = Vector2.ZERO
	animation_player.play("hit")

func pause_game() -> void:
	get_tree().paused = true

func flash() -> void:
	game_manager.play_flash()

func _ready() -> void:
	randomize_skin()

func randomize_skin():
	var index = randi() % sprites.size()
	for i in sprites.size():
		sprites[i].visible = (i == index)
		
