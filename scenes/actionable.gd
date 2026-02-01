extends Area2D




func _ready() -> void:
	add_to_group("actionable")

func action() -> void:
	get_parent().openDialogue()


func exit() -> void:
	get_parent().exitDialogue()
