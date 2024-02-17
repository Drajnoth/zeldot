extends Node2D

#Get screen information.
@onready var screen_height = get_tree().get_root().size.y
@onready var screen_width = get_tree().get_root().size.x

#Get HeartsPosition screen position.
@onready var hearts_position_position = %HeartsPosition.position

#Calculate distance needed between each heart.
@onready var hearts_distance_to_each_x = screen_width / 22
@onready var hearts_distance_to_each_y = screen_width / 22

#Set heart data.
@onready var hearts_size: Vector2 = Vector2(
	40,
	40
)
var heart_color: Color = Color(55, 0, 0, 255)
var hearts_position_array: Array[Vector2] = []

#Initialize new hearts script.
@onready var hearts_script = %HeartsScript

func init_hearts_positions():
	#Initialize correct heart array size.
	hearts_position_array.resize(hearts_script.get_heart_amount())
	hearts_position_array.fill(Vector2.ZERO)

	#Setup heart position variables and start.
	var heart_position_start = 0
	var heart_position_x = heart_position_start
	var heart_position_y = heart_position_start

	#Set array heart positions on screen.
	for i in hearts_position_array.size():
		hearts_position_array[i].x += heart_position_x
		hearts_position_array[i].y = heart_position_y

		if hearts_position_array[i].x >= screen_width - hearts_position_position.x - hearts_size.x:
			heart_position_y += hearts_distance_to_each_y
			hearts_position_array[i].y = heart_position_y
			heart_position_x = heart_position_start

		hearts_position_array[i].x = heart_position_x
		heart_position_x += hearts_distance_to_each_x

func append_hearts_positions():
	#Get last array index position.
	var heart_position_start = 0
	var heart_position_x = hearts_position_array.back().x
	var heart_position_y = hearts_position_array.back().y

	#Set heart position x axis.
	heart_position_x += hearts_distance_to_each_x

	#Set heart position y axis if it's going offscreen.
	if heart_position_x >= screen_width - hearts_position_position.x - hearts_size.x:
		heart_position_y += hearts_distance_to_each_y
		heart_position_x = heart_position_start

	#Append new heart position to array.
	hearts_position_array.append(Vector2(heart_position_x, heart_position_y))

func _ready():
	init_hearts_positions()

func _physics_process(_delta):
	if hearts_script.add_heart_input and hearts_script.get_heart_amount() != hearts_position_array.size():
		append_hearts_positions()
	queue_redraw()

func _draw():
	for i in hearts_position_array.size():
		draw_rect(
		Rect2(hearts_position_array[i], hearts_size), 
		heart_color
		)
