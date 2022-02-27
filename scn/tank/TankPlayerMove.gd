extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var local = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_network_master() == get_tree().get_network_unique_id():
		get_parent().movement = Vector2.ZERO
		get_parent().movement.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
		get_parent().movement.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	pass
