extends AnimatedSprite

func _ready():
	self.play("ricochet")

func _on_ricochet_animation_animation_finished():
	queue_free()
