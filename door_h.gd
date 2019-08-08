extends Spatial

onready var anim = get_node("anim")


func open():
	anim.play("move")


func _on_Area_body_entered(body):
	if body.get("haskey1") == true:
		anim.play("move")
