extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _play_sound(sound, volume=0):
	print("playing" + str(sound))
	set_volume_db(volume)
	set_stream(sound)
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
