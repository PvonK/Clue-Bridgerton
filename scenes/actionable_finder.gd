extends Area2D


func _ready() -> void:
	area_exited.connect(_on_area_exited)


func _on_area_exited(body: Node2D) -> void:
	if body.is_in_group("actionable"):
		body.exit()
