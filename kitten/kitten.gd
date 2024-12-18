class_name Kitten extends CharacterBody2D


@export var gravity: float = 981.0
@export var speed: float = 1024
var energy = 100.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()


func move(direction: float):
	velocity.x = direction * speed
