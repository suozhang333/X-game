extends GameScreen

#@export var experiment_scene : PackedScene
#@onready var _anchor := $Center/Anchor
#
#func _ready() -> void:
	#var experiment = experiment_scene.instantiate()
	#_anchor.add_child(experiment)

@onready var _tiles := $Center/Stage/Tiles as TileMap
func _ready() -> void:
	var i := 0
	var level : GameLevel = Variables.current_level
	var half = floor(level.width / 2)
	var remainder = level.width % 2
	for y in range(-half - remainder, half):
		for x in range(-half - remainder, half):
			if Types.tile_coordinates.has(level.layout[i]):
				_tiles.set_cell(0, Vector2i(x, y), 0, Types.tile_coordinates[level.layout[i]])
			i += 1
