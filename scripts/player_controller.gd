extends CharacterBody2D

@export var walking_speed: float = 2
@onready var actionable_finder: Area2D = $actionable_finder

func _process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0

	if Input.is_action_pressed("ui_left"):
		velocity.x = -walking_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walking_speed
	if Input.is_action_pressed("ui_up"):
		velocity.y = -walking_speed
	if Input.is_action_pressed("ui_down"):
		velocity.y = walking_speed

	move_and_collide(velocity)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _physics_process(delta: float) -> void:
	pass
