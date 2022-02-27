extends Node

var local = true

func _process(delta):
	$Pointer.global_transform.origin = get_parent().aim_point
	if get_network_master() == get_tree().get_network_unique_id():
		var mouse_pos = get_viewport().get_mouse_position()
		var camera = get_viewport().get_camera()
		var aim_point = camera.project_position(mouse_pos, 25)
		get_parent().aim_point = aim_point
		pass
