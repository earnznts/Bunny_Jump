extends KinematicBody2D

var motion = Vector2(0,0)

export var Gravity = 65
export var SPEED = 500
export var JUMP = 1000

func _physics_process(delta):
	
	apply_gravity()
	jump()
	walk()
	
	move_and_slide(motion,Vector2( 0, -1))
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
		#print("I'm floor")
	motion.y = motion.y + Gravity

func jump():
	if Input.is_action_just_pressed("jump"):
		motion.y = -JUMP
	else: 
		motion.y

func walk():
	if  Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else: 
		motion.x = 0