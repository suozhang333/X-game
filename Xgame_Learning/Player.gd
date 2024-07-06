extends Node2D

@export var speed: int =250
@export var idle_texture: Texture2D
@export var run_texture: Texture2D
@export var run_textures: Array[Texture2D]

@onready var sprite: Sprite2D = $Sprite2D

enum State {
	IDLE,
	RUN,
}

var state: State = State.IDLE
func handle_input(delta: float):
	if Input.is_action_pressed("move_right"):
		state = State.RUN
		position.x += speed * delta
		sprite.flip_h = false
		return
	if Input.is_action_pressed("move_left"):
		state = State.RUN
		position.x -= speed * delta	
		sprite.flip_h = true
		return
	state = State.IDLE
	
func _process(delta: float) -> void:
	handle_input(delta)
	play_animation()

func play_animation():
	match state:
		State.IDLE:
			sprite.texture = idle_texture
		State.RUN:
			sprite.texture = run_texture

