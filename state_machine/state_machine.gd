class_name StateMachine extends Node


var states: Dictionary
var active_states: Dictionary


func _ready() -> void:
	for c in get_children():
		if c is State:
			states[c.name.to_snake_case()] = c


func _physics_process(delta: float) -> void:
	# Process conditions
	for sk in states.keys():
		var s = states[sk] as State
		var c = s.process_conditions()
		if c and not active_states.has(sk):
			active_states[sk] = s
			s.enter()
		elif not c and active_states.has(sk):
			active_states.erase(sk)
			s.exit()
	# Process states
	for s in active_states.values():
		s.physics_process(delta)


func _process(delta: float) -> void:
	for s in active_states.values():
		s.process(delta)
