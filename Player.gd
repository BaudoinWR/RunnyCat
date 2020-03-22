extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
var jump = 0
export(Array, AudioStream) var sounds
const MAX_JUMPS = 2
const ACCELERATION = 200
const MAX_SPEED = 300
const GRAVITY = 980
const MAX_FALL = 1000
const JUMP_SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Running")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var y = 0
	if not is_on_floor():
		y = move_toward(velocity.y, MAX_FALL, GRAVITY * delta)
	if Input.is_action_just_pressed("ui_select") && jump < MAX_JUMPS:
		jump = jump+1
		y = -JUMP_SPEED
		var sound_index = randi() % len(sounds)
		$AudioStreamPlayer2D.set_stream(sounds[sound_index])
		$AudioStreamPlayer2D.play()
	var x = move_toward(velocity.x, MAX_SPEED, ACCELERATION * delta)
	velocity = Vector2(x, y).clamped(MAX_SPEED)
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI / 4, false)
	if (position.y > 0):
		position = Vector2(position.x, 0)
	if is_on_floor():
		jump = 0
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider is RigidBody2D:
			collision.collider.apply_central_impulse(-collision.normal * velocity.length())
			collision.collider.set_collision_mask_bit(0, false)
			collision.collider.set_collision_layer_bit(0, false)
