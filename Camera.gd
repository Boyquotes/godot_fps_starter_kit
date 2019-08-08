extends Camera


func _ready():
	##Connect groups to follow player.
	get_tree().call_group("ghost", "set_camera", self)
	get_tree().call_group("woodmonster", "set_camera", self)
	get_tree().call_group("monster", "set_camera", self)
	get_tree().call_group("critter", "set_camera", self)
	get_tree().call_group("undead", "set_camera", self)
	get_tree().call_group("undeadBOSS", "set_camera", self)
	get_tree().call_group("monsterBOSS", "set_camera", self)
	get_tree().call_group("critterBOSS", "set_camera", self)
	get_tree().call_group("undeadBOSS", "set_camera", self)
	get_tree().call_group("MERC", "set_camera", self)
	get_tree().call_group("NPC", "set_camera", self)
	
	
	