extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var boop = load("res://Things/powerup.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Static")


func _on_Yarn_body_entered(body):
	if body.is_in_group("Player"):
		SoundPlayer._play_sound(boop, -10)
		queue_free()
