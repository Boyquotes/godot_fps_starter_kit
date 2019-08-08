extends WindowDialog

var inventory
var player
var level
var inventorysc
var gamesaver
export (String, FILE) var testing_area_scene

func _ready():
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):

	gamesaver = get_node("/root/GameSaver")
	level = Globals.levelv
	player = get_tree().get_root().get_node(level).find_node("Player")
	inventory = get_tree().get_root().get_node("Scene_PlayerInventory")

#func _on_Button_load1_pressed():
#	queue_free()
#	player.change_save_var(1)
#	Global_Player.load_state()
#	Global_Player.load_data()
#	GameSaver.load(1)
##	inventory.load_items()
#	#player.global_transform.origin = globals.get_respawn_position()
#	#Globals.popup_quit()
#	Globals.load_new_scene(testing_area_scene)
#	get_tree().paused = false
#	get_tree().get_root().get_node("Testing_Area").get_node("Player").get_node("HUD").visible = true
#
#
#func _on_Button_load2_pressed():
##	inventory = get_node("res://Scenes/Scene_PlayerInventory")
#	player.change_save_var(2)
#	Global_Player.load_state()
#	Global_Player.load_data()
#	gamesaver.load(2)
#
##	inventory.load_items()
#	#player.global_transform.origin = globals.get_respawn_position()
#	#Globals.popup_quit()
#	Globals.load_new_scene(testing_area_scene)
#	get_tree().paused = false
#	get_tree().get_root().get_node("Testing_Area").get_node("Player").get_node("HUD").visible = true
#	queue_free()
#
#func _on_Button_load3_pressed():
##	inventory = get_node("res://Scenes/Scene_PlayerInventory")
#	player.change_save_var(3)
#	Global_Player.load_state()
#	Global_Player.load_data()
#
#	gamesaver.load(3)
##	inventory.load_items()
#	#player.global_transform.origin = globals.get_respawn_position()
#	#Globals.popup_quit()
#	Globals.load_new_scene(testing_area_scene)
#	get_tree().paused = false
#	get_tree().get_root().get_node("Testing_Area").get_node("Player").get_node("HUD").visible = true
#	queue_free()

func _on_Button_save_pressed():
	$save.popup()


func _on_Button_load_pressed():
	$load.popup()


func _on_Button_save1_pressed():
	player.change_save_var(1)
	Global_Player.load_state()
	gamesaver.save(1)
	Global_Player.save_data()


func _on_Button_save2_pressed():
	player.change_save_var(2)
	Global_Player.load_state()
	gamesaver.save(2)
	Global_Player.save_data2()


func _on_Button_save3_pressed():
	player.change_save_var(3)
	Global_Player.load_state()
	gamesaver.save(3)
	Global_Player.save_data3()


#func _on_Button_new_pressed():
#	player.change_save_var(0)
#	Global_Player.load_state()
#	Global_Player.load_newdata()
#	gamesaver.load(0)

#	Globals.load_new_scene(testing_area_scene)

func _on_Button_quitgame_pressed():
	get_tree().quit()
