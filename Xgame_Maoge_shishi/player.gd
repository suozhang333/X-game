extends CharacterBody2D

@export var speed = 400
@onready var player=$Player

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)

func _on_body_entered(body):
	if body.is_in_group("pickable"):
		body.queue_free()
		print("item picked up!")
