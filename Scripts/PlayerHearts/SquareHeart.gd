class_name HeartColorRect
extends ColorRect

@onready var hearts_size: Vector2 = Vector2(
	40,
	40
)
@onready var hearts_position: Vector2 = Vector2(
	0,
	0
)

func _init():
	add_to_group("HeartColorRects")

func remove_heart():
	queue_free()

func _draw():
	draw_rect(
		Rect2(hearts_position, hearts_size),
		Color.WHITE
	)
