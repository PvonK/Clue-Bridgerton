extends Area2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Start"

var current_dialogue

func _ready() -> void:
	add_to_group("actionable")

func action() -> void:
	current_dialogue = DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)

func exit() -> void:
	if current_dialogue:
		current_dialogue.queue_free()
