extends Resource
class_name CharacterDef

@export var frames: SpriteFrames
@export var default_animation: StringName = &"default"
@export var portrait: Texture2D
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = &"Start"
@export var is_win_condition: bool = false
