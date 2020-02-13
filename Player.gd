extends KinematicBody2D

const MOVE_SPEED = 400
const Shotgun = preload("res://combat/shotgun/shotgun.tscn")

var EquipedGun = null
func _ready():
	yield(get_tree(), "idle_frame")
	EquipedGun = Shotgun.instance()
	#EquipedGun.position = get_global_position()
	$Weapon.add_child(EquipedGun)
		
func _physics_process(delta):
	var move_vec = Vector2()
	var mouse_pos = get_viewport().get_mouse_position()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	
	$AnimatedSprite.stop()
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
	
	if Input.is_action_just_pressed("shoot"):
		EquipedGun.Shoot()
		
func kill():
	get_tree().reload_current_scene()
