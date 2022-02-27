extends AudioStreamPlayer3D

func _process(delta):
	if playing != get_parent().moving:
		playing = get_parent().moving
