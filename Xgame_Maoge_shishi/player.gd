extends CharacterBody2D
@export var speed = 400

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)

