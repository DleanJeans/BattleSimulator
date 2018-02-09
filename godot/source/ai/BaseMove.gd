extends Node2D

signal point_reached

export(float) var near_distance_threshold = 50
export(bool) var enabled = false setget set_enabled

var target

var _steer_velocity

func _ready():
	$Steering.set_character(get_parent())
	_fix_lag()

func _fix_lag():
	# DO NOT DELETE THIS
	set_physics_process(enabled)

func stop():
	$Steering.arrive_off()

func to(target):
	self.target = target
	$Steering.arrive_on(target)

func _physics_process(delta):
	_steer_velocity = $Steering.steer()

	_stop_if_reached_target()
	_update_movement()

func _update_movement():
	pass

func _stop_if_reached_target():
	if target == null: return
	
	var distance_to_target = get_parent().get_locator().distance_to(target)
	
	if distance_to_target <= near_distance_threshold:
#		$Steering.arrive_off()
		_steer_velocity = Vector2()
		emit_signal("point_reached")

func set_enabled(is_enabled):
	enabled = is_enabled
	if is_inside_tree():
		set_physics_process(enabled)