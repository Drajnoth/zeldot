class_name HeartsScript
extends Node

var heart_amount: int
var heart_amount_limit: int = 50
var heart_amount_minimum = 0
var add_heart_input: bool = false
var remove_heart_input: bool = false

func _physics_process(_delta):
	add_heart_input = Input.is_action_just_pressed("w")
	remove_heart_input = Input.is_action_just_pressed("s")
	if add_heart_input:
		set_heart_amount(get_heart_amount() + 1)
	if remove_heart_input:
		set_heart_amount(get_heart_amount() - 1)

func _init():
	set_heart_amount(5)

func set_heart_amount(s_heart_amount: int) -> void:
	heart_amount = limit_heart_amount(s_heart_amount)

func get_heart_amount() -> int:
	return heart_amount

func limit_heart_amount(h_heart_amount: int) -> int:
	if h_heart_amount > heart_amount_limit:
		print("You have exceeded your Health limit!")
		return heart_amount_limit
	elif h_heart_amount == heart_amount_minimum or h_heart_amount <= heart_amount_minimum:
		return heart_amount_minimum
	else:
		return h_heart_amount
