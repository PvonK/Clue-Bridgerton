extends Node2D

@export var definition:CharacterDef
@onready var visual: AnimatedSprite2D = $visual

var current_dialogue

func _ready() -> void:
	if definition:
		visual.sprite_frames = definition.frames
		#visual.sprite_frames = definition.portrait

	visual.play()


func openDialogue():
	current_dialogue = DialogueManager.show_dialogue_balloon(
		definition.dialogue_resource,
		definition.dialogue_start
		)
	if current_dialogue and current_dialogue.has_method("set_portrait"):
		print("setting portrait")
		current_dialogue.call(
			"set_portrait",
			definition.portrait
			)



func exitDialogue() -> void:
	if current_dialogue:
		current_dialogue.queue_free()
