extends Node2D
@export var map_scene: PackedScene

func _ready():
	new_game()
	
func new_game():
	$Player.start($StartPosition.position)
	var map = map_scene.instantiate()
	add_child(map)
