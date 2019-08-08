extends Spatial
const entity = "res://entity2.gd"
onready var anim = get_node("anim")


func open():
	anim.play("move")


func _on_Area_body_entered(body):
	if body.get("has_key2") == true:
		anim.play("move")
