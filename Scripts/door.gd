extends Spatial

onready var anim = get_node("anim")


func open():
	anim.play("move")


func _on_Area_body_entered(body):
	if body.get("Has_Key2") == true:
		anim.play("move")
