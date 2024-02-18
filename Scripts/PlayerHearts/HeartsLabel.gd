extends Label

@onready var hearts_script: HeartsScript = null
@onready var label_font: Font = null


func _ready():
	
	hearts_script = %HeartsScript
	label_font = load("res://Resources/Fonts/Copyduck/Copyduck.otf")
	
	if hearts_script != null:
		enable_label()
	else:
		hearts_script_error()

func enable_label():
	set_text(str(hearts_script.get_heart_amount()))
	if label_font != null and label_font == Font:
		label_settings.set_font(label_font)
	set_physics_process(true)

func disable_label():
	set_physics_process(false)
	set_text("")
	queue_free()

func hearts_script_error():
	set_physics_process(false)
	print("An error has occured setting up HeartsLabel.gd, hearts_script is NULL")

func _physics_process(delta) -> void:
	var heart_amount = hearts_script.get_heart_amount()
	
	if heart_amount == hearts_script.heart_amount_dead \
	or heart_amount <= hearts_script.heart_amount_dead \
	or hearts_script == null:
		disable_label()
	
	set_text("Health: " + str(heart_amount))
