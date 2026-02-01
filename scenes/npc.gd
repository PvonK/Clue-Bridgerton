extends Node2D

@export var definition: CharacterDef
@onready var visual: AnimatedSprite2D = $visual

# Optional: assign sounds from inspector on the NPC (or leave empty and set streams on the players)
@export var sfx_open: AudioStream
@export var sfx_close: AudioStream

# These nodes should exist as children of the NPC:
# - SfxOpen (AudioStreamPlayer)
# - SfxClose (AudioStreamPlayer)
@onready var sfx_open_player: AudioStreamPlayer = get_node_or_null("SfxOpen")
@onready var sfx_close_player: AudioStreamPlayer = get_node_or_null("SfxClose")

var current_dialogue: Node = null

func _ready() -> void:
	# Setup visuals
	if definition:
		visual.sprite_frames = definition.frames
	visual.play()

	# Setup SFX players to work even if the SceneTree is paused by dialogue
	_setup_sfx_player(sfx_open_player, sfx_open)
	_setup_sfx_player(sfx_close_player, sfx_close)

func _setup_sfx_player(p: AudioStreamPlayer, fallback_stream: AudioStream) -> void:
	if not p:
		return

	# IMPORTANT: prevents "sound plays only after unpause"
	p.process_mode = Node.PROCESS_MODE_ALWAYS

	# If you assigned sfx_open/sfx_close in inspector, use them
	if fallback_stream:
		p.stream = fallback_stream

	# Optional: helps prevent cutting off / stacking issues (tweak as you like)
	# p.bus = "SFX"
	# p.volume_db = -6.0

func _play_ui_sfx(p: AudioStreamPlayer) -> void:
	if not p or not p.stream:
		return
	# Force immediate start from beginning (prevents "queued/laggy" feel)
	p.stop()
	p.play(0.0)

func openDialogue() -> void:
	_play_ui_sfx(sfx_open_player)

	# If one is already open, you can close it first (optional)
	# exitDialogue()

	current_dialogue = DialogueManager.show_dialogue_balloon(
		definition.dialogue_resource,
		definition.dialogue_start
	)

	if current_dialogue and current_dialogue.has_method("set_portrait"):
		current_dialogue.call("set_portrait", definition.portrait)

func exitDialogue() -> void:
	_play_ui_sfx(sfx_close_player)

	if current_dialogue:
		current_dialogue.queue_free()
		current_dialogue = null
