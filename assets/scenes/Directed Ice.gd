extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CollisionPolygonIceBottom").disabled = false
	get_node("CollisionPolygonIceTop").disabled = false

func collision_manipulation():
	var directon = get_parent().get_node("Penguin").get("velocity")
	if directon.x != 0: 
		get_node("CollisionPolygonIceBottom").disabled = true
		get_node("CollisionPolygonIceTop").disabled = true
	if directon.y != 0 && !get_node("Area2D").overlaps_body(get_parent().get_node("Penguin")):
		get_node("CollisionPolygonIceBottom").disabled = false
		get_node("CollisionPolygonIceTop").disabled = false

func _physics_process(_delta):
	collision_manipulation()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
