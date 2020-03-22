extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var cat = $Cat
const YARN_SPAWN_RATE = 20
const MAX_HEIGHT = 70
var yarn = load("res://Things/Yarn.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var spawn = rand_range(0, 1)
	if spawn > (1 - 1 / float(YARN_SPAWN_RATE)):
		var new_yarn = yarn.instance()
		new_yarn.position = Vector2(cat.position.x + 1000, rand_range(-MAX_HEIGHT, -10))
		add_child(new_yarn)
		pass
