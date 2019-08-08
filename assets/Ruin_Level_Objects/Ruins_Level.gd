extends Spatial

func _ready():
	
	get_tree().get_root().get_node("Globals").isready = true
