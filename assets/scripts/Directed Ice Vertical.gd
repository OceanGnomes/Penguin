extends StaticBody2D

# called when the node enters the scene tree for the first time.
func _ready():
	get_node("CollisionLeft").disabled = false
	get_node("CollisionRight").disabled = false

func collision_manipulation():
	var directon = get_parent().get_node("Penguin").get("velocity")
	if directon.y != 0: 
		get_node("CollisionLeft").disabled = true
		get_node("CollisionRight").disabled = true
	if directon.x != 0 && !get_node("Area2D").overlaps_body(get_parent().get_node("Penguin")):
		get_node("CollisionLeft").disabled = false
		get_node("CollisionRight").disabled = false

# called every frame
func _physics_process(_delta):
	collision_manipulation()
