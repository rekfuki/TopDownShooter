extends KinematicBody2D

var Ricochet = preload("res://combat/ricochet.tscn")

var velocity
var damage = 300
var speed = 2000

func init(position: Vector2, rotation: Vector2):
	self.position = position
	self.look_at(rotation)
	self.velocity = Vector2(self.speed, 0).rotated(self.rotation)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(self.velocity * delta)
	if collision:
		var ricochet = Ricochet.instance()
		ricochet.position = collision.position
		ricochet.rotate(atan2(collision.normal.y, collision.normal.x))
		
		get_parent().add_child(ricochet)
		queue_free()
