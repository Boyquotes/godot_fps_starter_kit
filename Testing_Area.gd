extends Spatial

var globals
var player
var level
var loadstate


func _ready():
	globals = get_node("/root/Globals")
	level = Globals.levelv
	loadstate = Globals.loadgstate
	player = get_tree().get_root().get_node(level).find_node("Player")
	get_tree().get_root().get_node("Globals").isready = true

	if loadstate == 0:
		player.change_save_var(0)
		GameSaver.load(0)
	if loadstate == 1:
		player.change_save_var(1)
		GameSaver.load(1)
	if loadstate == 2:
		player.change_save_var(2)
		GameSaver.load(2)
	if loadstate == 3:
		player.change_save_var(3)
		GameSaver.load(3)

	Globals.play_sound("music")
	
	