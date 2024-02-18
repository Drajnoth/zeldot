extends Node2D

#Get screen information.
@onready var screen_height = get_tree().get_root().size.y
@onready var screen_width = get_tree().get_root().size.x

#Calculate distance needed for padding and size.
@onready var item_box_padding: Vector2 = Vector2(
	screen_width / 7,
	screen_width / 50
)
@onready var item_box_size: Vector2 = Vector2(
	175,
	190
)
@onready var small_item_box_size: Vector2 = Vector2(
	item_box_size.x * 0.7,
	item_box_size.y * 0.7
)
@onready var small_item_box_left_padding: Vector2 = Vector2(
	item_box_padding.x - small_item_box_size.x - item_box_size.x * 0.1,
	item_box_padding.y + item_box_size.y * 0.5 - small_item_box_size.y * 0.5
)
@onready var small_item_box_right_padding: Vector2 = Vector2(
	item_box_padding.x + item_box_size.x + item_box_size.x * 0.1,
	item_box_padding.y + item_box_size.y * 0.5 - small_item_box_size.y * 0.5
)
@onready var item_box_is_filled: bool = false
@onready var item_box_lines_width: float = 10
@onready var small_item_box_lines_width: float = item_box_lines_width / 2
@onready var item_box_lines_color: Color = Color.WHITE


func _draw():
	draw_rect(
		Rect2(position + item_box_padding, item_box_size),
		item_box_lines_color,
		item_box_is_filled,
		item_box_lines_width
	)
	draw_rect(
		Rect2(position + small_item_box_left_padding, small_item_box_size),
		item_box_lines_color,
		item_box_is_filled,
		small_item_box_lines_width
	)
	draw_rect(
		Rect2(position + small_item_box_right_padding, small_item_box_size),
		item_box_lines_color,
		item_box_is_filled,
		small_item_box_lines_width
	)
