extends FlowContainer

@onready var hearts_script = %HeartsScript

func _ready():
	for i in hearts_script.get_heart_amount():
		add_child(HeartColorRect.new())

func _physics_process(delta):
	var hearts_script_heart_amount = hearts_script.get_heart_amount()
	var hearts_color_rects_group_array = get_tree().get_nodes_in_group("HeartColorRects")
	var hearts_color_rects_group_array_size = hearts_color_rects_group_array.size()
	
	# Check if group is bigger or smaller than the amount of hearts and remove or add if that is 
	# the case.
	if hearts_script_heart_amount < hearts_color_rects_group_array_size:
		var removing_child = hearts_color_rects_group_array.pop_back()
		removing_child.remove_heart()
	elif hearts_script_heart_amount > hearts_color_rects_group_array_size:
		add_child(HeartColorRect.new())
