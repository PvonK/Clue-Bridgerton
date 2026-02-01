extends CanvasLayer


@onready var sprite1: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D"
@onready var sprite2: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D2"
@onready var animated_sprite_2d_3: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D3"
@onready var animated_sprite_2d_4: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D4"
@onready var animated_sprite_2d_5: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D5"
@onready var animated_sprite_2d_8: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D8"
@onready var animated_sprite_2d_7: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D7"
@onready var animated_sprite_2d_6: AnimatedSprite2D = $"../endscreen/AnimatedSprite2D6"


func _ready():
	sprite1.animation_looped.connect(on_loop1)
	sprite2.animation_looped.connect(on_loop2)
	animated_sprite_2d_3.animation_looped.connect(on_loop3)
	animated_sprite_2d_4.animation_looped.connect(on_loop4)
	animated_sprite_2d_5.animation_looped.connect(on_loop5)
	animated_sprite_2d_6.animation_looped.connect(on_loop6)
	animated_sprite_2d_7.animation_looped.connect(on_loop7)
	animated_sprite_2d_8.animation_looped.connect(on_loop8)
	randomize()
	randomize_sprite(sprite1)
	randomize_sprite(sprite2)
	visible = false

func _process(delta: float) -> void:
	if State.game_ended:
		visible = true

func randomize_sprite(sprite: Node2D):
	var viewport_size = Vector2(1920, 1080)
	var sprite_size = Vector2(128, 128)

	var x = randf_range(0, viewport_size.x - sprite_size.x)
	var y = randf_range(0, viewport_size.y - sprite_size.y)

	sprite.position = Vector2(x, y)


func on_loop1():
	randomize_sprite(sprite1)

func on_loop2():
	randomize_sprite(sprite2)


func on_loop3():
	randomize_sprite(animated_sprite_2d_3)

func on_loop4():
	randomize_sprite(animated_sprite_2d_4)

func on_loop5():
	randomize_sprite(animated_sprite_2d_5)

func on_loop6():
	randomize_sprite(animated_sprite_2d_6)

func on_loop7():
	randomize_sprite(animated_sprite_2d_7)

func on_loop8():
	randomize_sprite(animated_sprite_2d_8)
