extends Area

# Declare member variables here. Examples:
var switch3 = false;
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
		pass

func _on_s1_body_entered(body):
	if body is KinematicBody:
		queue_free()
		
		switch3 = true
		
		get_tree().reload_current_scene()