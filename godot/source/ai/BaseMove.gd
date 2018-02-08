extends Node2D

signal point_reached

export(float) var near_distance_threshold = 50

var target

var _steer_velocity

func _ready():
	$Steering.set_character(get_parent())

func stop():
	$Steering.arrive_off()

func to(target):
	self.target = target
	$Steering.arrive_on(target)

func _physics_process(delta):
	_steer_velocity = $Steering.steer()

	_update_movement()
	_stop_if_reached_target()

func _update_movement():
	pass

func _stop_if_reached_target():
	if target == null: return
	
	var distance_to_target = get_parent().get_locator().distance_to(target)
	
	if distance_to_target <= near_distance_threshold:
		$Steering.arrive_off()
		emit_signal("point_reached")