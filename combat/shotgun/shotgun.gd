extends Area2D

var Bullet = preload("res://combat/shotgun/simple_bullet.tscn")
var pellets = 4
var spread = [-0.03, -0.01, 0.01, 0.03]
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func Shoot():
	var mouse_pos = get_global_mouse_position()
	var muzzle = $Muzzle.get_global_position()
	
	print(get_global_position())
	print(muzzle)
	for i in range(pellets):
		var bullet = Bullet.instance()
		
		if i == 0 || i == 3:
			bullet.get_node("Sprite").self_modulate = Color(0.94, 0.92, 0.04)

		bullet.init(muzzle, mouse_pos.rotated(spread[i]))
		get_tree().get_root().add_child(bullet)

