extends KinematicBody

class_name TankBase

export var speed = 300
export var turn_speed = 0.3
onready var tween = $Tween

var movement = Vector2.ZERO
var aim_point = Vector3.ZERO
var angle = 0
var aim_angle = 0
var v_velocity = 0
var moving = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Movement, body rotation
	moving = movement != Vector2.ZERO
	if moving:
		angle = movement.angle()
		move_and_slide(-Vector3.FORWARD.rotated(Vector3.UP, rotation.y) * delta * speed)
	rotation.y = lerp_angle(rotation.y, (angle + PI/2) , turn_speed)
	if not is_on_floor():
		v_velocity -= 9.8 * delta
		move_and_slide(Vector3.UP * v_velocity)
	else:
		v_velocity = 0
	# Aiming
	var aim_delta = aim_point - transform.origin
	aim_angle = -atan2(aim_delta.x, aim_delta.z) + PI/2
	$"gun_parent/gun_handle".rotation.z = aim_angle + rotation.y - PI/2
