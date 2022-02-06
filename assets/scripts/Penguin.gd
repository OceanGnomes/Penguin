extends KinematicBody2D

# penguin movement speed
export (int) var speed = 800

# penguin velocity
var velocity = Vector2()

# direction penguin is facing
var facing = Vector2()

# penguin animated sprite
onready var animatedSprite = $AnimatedSprite

# temporary movement logic
func get_input():
	if velocity == Vector2.ZERO:
		if Input.is_action_pressed("right"):
			velocity.x = 1
		if Input.is_action_pressed("left"):
			velocity.x = -1	
		if Input.is_action_pressed("down"):
			velocity.y = 1
		if Input.is_action_pressed("up"):
			velocity.y = -1
		
		facing = velocity

# change the direction of the sprite appopriately
func change_direction():
	if facing.x < 0:
		animatedSprite.set_flip_h(true)
	elif facing.x > 0:
		animatedSprite.set_flip_h(false)

func _physics_process(delta):
	get_input()
	change_direction()
	velocity = velocity.normalized() * speed

	if move_and_collide(velocity * delta) != null:
		global_translate(Vector2(-facing.x, -facing.y))
		velocity = Vector2(0, 0)
	
	# check for sliding animation (in velocity)
	if velocity.x != 0:
		animatedSprite.animation = "slide-side"
	elif velocity.y < 0:
		animatedSprite.animation = "slide-up"
	elif velocity.y > 0:
		animatedSprite.animation = "slide-down"
	
	# check for idle animation (in facing)
	elif facing.x != 0:
		animatedSprite.animation = "idle-side"
	elif facing.y < 0:
		animatedSprite.animation = "idle-up"
	elif facing.y > 0:
		animatedSprite.animation = "idle-down"
