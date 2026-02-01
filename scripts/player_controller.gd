extends CharacterBody2D

@export var walking_speed: float = 2
@onready var actionable_finder: Area2D = $actionable_finder
@onready var visual: AnimatedSprite2D = $visual

var convos_had = []
var movement_vector = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:

	velocity = movement_vector

	if velocity.length() > 0:
		visual.speed_scale = 2
	else:
		visual.speed_scale = 1
	
	move_and_collide(velocity)


func _unhandled_input(event: InputEvent) -> void:
	movement_vector = Vector2.ZERO

	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0 and can_talk(actionables[0]):
			convos_had.append(actionables[0])
			actionables[0].action()
			return
	if Input.is_action_pressed("ui_left"):
		movement_vector.x = -walking_speed
	elif Input.is_action_pressed("ui_right"):
		movement_vector.x = walking_speed
	if Input.is_action_pressed("ui_up"):
		movement_vector.y = -walking_speed
	if Input.is_action_pressed("ui_down"):
		movement_vector.y = walking_speed



func _physics_process(delta: float) -> void:
	pass

func can_talk(actionable):
	print(convos_had)
	return len(convos_had) < 6 or actionable in convos_had
