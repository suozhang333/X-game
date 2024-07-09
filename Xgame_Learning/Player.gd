extends Node2D

@export var speed: int =250

@onready var sprite: AnimatedSprite2D = %Sprite

enum State {
	IDLE,
	RUN,
}

var state: State = State.IDLE
func handle_input(delta: float):
	if Input.is_action_pressed("move_right"):
		state = State.RUN
		sprite.position.x += speed * delta
		sprite.flip_h = false
		return
	elif  Input.is_action_pressed("move_left"):
		state = State.RUN
		sprite.position.x -= speed * delta	
		sprite.flip_h = true
		return
	else:	
		state = State.IDLE
	
func _process(delta: float) -> void:
	handle_input(delta)
	play_animation()

func play_animation():
	match state:
		State.IDLE:
			sprite.play("idle")
			#print("playing idle")
		State.RUN:
			sprite.play("run")
			#print("playing run")

