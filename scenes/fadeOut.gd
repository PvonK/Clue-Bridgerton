extends CanvasLayer

@export var show_time: float = 2.0      # seconds fully visible
@export var fade_time: float = 1.0      # seconds to fade out
@export var remove_after: bool = true   # queue_free after fade

@onready var bg: ColorRect = $BG

func _ready() -> void:
	# Ensure it's visible and fully opaque at start
	bg.modulate.a = 1.0

	# Wait a bit, then fade out
	await get_tree().create_timer(show_time).timeout

	var t := create_tween()
	t.tween_property(bg, "modulate:a", 0.0, fade_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await t.finished

	var InitDialogue = load("res://assets/dialogue/start_dialogue.dialogue")
	DialogueManager.show_dialogue_balloon_scene("res://scenes/dialogueTutorial/balloon_big.tscn", InitDialogue, "Start")


	if remove_after:
		queue_free()  # removes the overlay from scene
	else:
		visible = false
