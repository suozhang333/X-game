extends ColorRect

func _ready() -> void:
	# randomize the colors	
	color = Color(
	randf_range(0.0, 1.0),
	randf_range(0.0, 1.0),
	randf_range(0.0, 1.0)
	)
	
	# creating realism with randomization
	var number = randf()
	if number > 0.9:
		color = Color.DARK_GREEN
	elif number > 0.7:
		color = Color.SADDLE_BROWN
	else:
		color = Color.TRANSPARENT
