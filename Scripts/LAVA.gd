extends Area


func _on_LAVA_body_entered(body):
	if body is KinematicBody:
			get_tree().reload_current_scene()
