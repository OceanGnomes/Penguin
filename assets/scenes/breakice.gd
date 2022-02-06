extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal deadpenguin
var isbroken = false
onready var anim = $iceanim
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

		
func _on_breakice_body_exited(_CollisionPolygon2):
	anim.play("breaking")
	isbroken = true

func _on_breakice_body_entered(body):
	if isbroken == true:
		emit_signal("deadpenguin")
