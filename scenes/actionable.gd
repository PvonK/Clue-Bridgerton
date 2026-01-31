extends Area2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Start"
@export var portrait_texture: Texture2D

var current_dialogue

func _ready() -> void:
	add_to_group("actionable")

func action() -> void:
	current_dialogue = DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
	if current_dialogue and current_dialogue.has_method("set_portrait"):
		print("setting portrait")
		current_dialogue.call("set_portrait", portrait_texture)

func exit() -> void:
	if current_dialogue:
		current_dialogue.queue_free()
