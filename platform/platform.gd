@tool
class_name Platform extends AnimatableBody2D


@export var size: Vector2:
	set(value):
		size = value.abs()
		has_size_changed = true
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D
var has_size_changed: bool


func _physics_process(_delta: float) -> void:
	if has_size_changed:
		has_size_changed = false
		if collision_shape:
			var s = collision_shape.shape as RectangleShape2D
			if s: s.size = size
		if sprite and sprite.region_enabled:
			var s = size / 4.0
			sprite.region_rect = Rect2(0, 0, s.x, 8)
			sprite.position.y = (-size.y * 0.5) + 16.0
