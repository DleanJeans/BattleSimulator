extends "res://source/ai/warrior/AINode.gd"

signal point_reached

export(float) var point_radius = 5

var target

func _ready():
	var host = get_parent().get_host()
	$Steering.host_path = host.get_path()

func to(target):
	self.target = target
	$Steering.arrive_on(target)

func _physics_process(delta):
	var steer = $Steering.steer()
	host.move.towards(steer)
	
	var speed = steer.length()
	if speed < point_radius:
		$Steering.arrive_off()
		emit_signal("point_reached")