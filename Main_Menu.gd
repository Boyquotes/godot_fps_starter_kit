extends Control

var start_menu
var load_select_menu
var options_menu
var player


export (String, FILE) var testing_area_scene
export (String, FILE) var space_level_scene
export (String, FILE) var ruins_level_scene
export (String, FILE) var church_level_scene

func _ready():

	## Connect Panels
	start_menu = $Start_Menu
	load_select_menu = $Load_Select_Menu
	options_menu = $Options_Menu
	
	## Connect all of the start menu buttons
	$Start_Menu/Button_Start.connect("pressed", self, "start_menu_button_pressed", ["start"])
	$Start_Menu/Button_Start.connect("pressed", self, "start_menu_button_pressed", ["credits"])
	$Start_Menu/Button_Options.connect("pressed", self, "start_menu_button_pressed", ["options"])
	$Start_Menu/Button_Quit.connect("pressed", self, "start_menu_button_pressed", ["quit"])

	## Connect all of the level select menu buttons
	$Load_Select_Menu/Button_Back.connect("pressed", self, "load_select_menu_button_pressed", ["back"])
	$Load_Select_Menu/Button_Load_1.connect("pressed", self, "load_select_menu_button_pressed", ["load1"])
	$Load_Select_Menu/Button_Load_2.connect("pressed", self, "load_select_menu_button_pressed", ["load2"])
	$Load_Select_Menu/Button_Load_3.connect("pressed", self, "load_select_menu_button_pressed", ["load3"])
	$Load_Select_Menu/Button_Newgame.connect("pressed", self, "load_select_menu_button_pressed", ["newgame"])
	$Load_Select_Menu/Button_Test.connect("pressed", self, "load_select_menu_button_pressed", ["test"])
	$Load_Select_Menu/Button_Space.connect("pressed", self, "load_select_menu_button_pressed", ["space"])
	$Load_Select_Menu/Button_Ruins.connect("pressed", self, "load_select_menu_button_pressed", ["ruins"])
	
	## Connect all of the options menu buttons
	$Options_Menu/Button_Back.connect("pressed", self, "options_menu_button_pressed", ["back"])
	$Options_Menu/Button_Fullscreen.connect("pressed", self, "options_menu_button_pressed", ["fullscreen"])
	$Options_Menu/Check_Button_VSync.connect("pressed", self, "options_menu_button_pressed", ["vsync"])
	$Options_Menu/Check_Button_Debug.connect("pressed", self, "options_menu_button_pressed", ["debug"])
	
	## Connect all of the Credits menu buttons
	$Credits/Button_Back.connect("pressed", self, "options_menu_button_pressed", ["back"])
	$Credits/Button_Open_Godot.connect("pressed", self, "start_menu_button_pressed", ["open_godot"])
	$Credits/Button_Open_Miz.connect("pressed", self, "start_menu_button_pressed", ["open_miz"])
	$Credits/Button_Open_fpstutorial.connect("pressed", self, "start_menu_button_pressed", ["open_fps"])
	$Credits/Button_Open_GDquest.connect("pressed", self, "start_menu_button_pressed", ["open_gdquest"])
	$Credits/Button_Open_Toffe.connect("pressed", self, "start_menu_button_pressed", ["open_toffe"])
	
	
	## Some times when returning to the title screen the mouse is still captured even though it shouldn't be.
	## To prevent this from breaking the game, we just set it here too
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


	## Get the mouse and joypad sensitivity
	$Options_Menu/HSlider_Mouse_Sensitivity.value = Globals.mouse_sensitivity
	$Options_Menu/HSlider_Joypad_Sensitivity.value = Globals.joypad_sensitivity


func start_menu_button_pressed(button_name):
	if button_name == "start":
		load_select_menu.visible = true
		start_menu.visible = false
	elif button_name == "open_godot":
		OS.shell_open("https://godotengine.org/")
	elif button_name == "open_miz":
		OS.shell_open("https://www.youtube.com/watch?v=q0sLPbyIbQg")
	elif button_name == "open_fps":
		OS.shell_open("http://docs.godotengine.org/en/3.1/tutorials/3d/fps_tutorial/index.html")
	elif button_name == "open_gdquest":
		OS.shell_open("https://www.youtube.com/watch?v=ML-hiNytIqE")
	elif button_name == "open_toffe":
		OS.shell_open("https://www.youtube.com/watch?v=_-LgLa9PR44")
	elif button_name == "options":
		options_menu.visible = true
		start_menu.visible = false
	elif button_name == "quit":
		get_tree().quit()


func load_select_menu_button_pressed(button_name):
	
	##level_select("LEVEL NAME") - loads level variables into player and Globals scripts
	##change_globalsave_var - loads save game data variable into player and Globals scripts 
	######################### so that when the level loads the level script loads the right save files
	
	##Global_Player.loadstate() - sets Inventory save data variables into player and global scripts
	##Global.Player.loaddata() - loads data so it shows up in the inventory.
	##load_level() - loads the level based on level varible in Globals
	
	
	if button_name == "back":
		start_menu.visible = true
		load_select_menu.visible = false
		
		
	elif button_name == "newgame":
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Church_Level")
		Globals.change_globalsave_var(0)
		load_level()
		
		
	elif button_name == "load1":
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Church_Level")
		Globals.change_globalsave_var(1)
		load_level()
		
		
	elif button_name == "load2":
		
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Church_Level")
		Globals.change_globalsave_var(2)
		load_level()


	elif button_name == "load3":
		
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Church_Level")
		Globals.change_globalsave_var(3)
		load_level()
		
		
	elif button_name == "test":
		
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Testing_Area")
		Globals.change_globalsave_var(0)
		Global_Player.load_state()
		Global_Player.load_data()
		Globals.load_new_scene(testing_area_scene)
		
		
	elif button_name == "space":
		
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Space_Level")
		Globals.change_globalsave_var(0)
		Global_Player.load_state()
		Global_Player.load_data()
		Globals.load_new_scene(space_level_scene)
		
		
	elif button_name == "ruins":
		
		set_mouse_and_joypad_sensitivity()
		Globals.level_select("Ruins_Level")
		Globals.change_globalsave_var(0)
		Global_Player.load_state()
		Global_Player.load_data()
		Globals.load_new_scene(ruins_level_scene)


func options_menu_button_pressed(button_name):
	if button_name == "back":
		start_menu.visible = true
		options_menu.visible = false

	elif button_name == "fullscreen":

		OS.window_fullscreen = !OS.window_fullscreen

	elif button_name == "vsync":

		OS.vsync_enabled = $Options_Menu/Check_Button_VSync.pressed

	elif button_name == "debug":

		Globals.set_debug_display($Options_Menu/Check_Button_Debug.pressed)


func set_mouse_and_joypad_sensitivity():
	## Set the mouse and joypad sensitivity
	Globals.mouse_sensitivity = $Options_Menu/HSlider_Mouse_Sensitivity.value
	Globals.joypad_sensitivity = $Options_Menu/HSlider_Joypad_Sensitivity.value

func load_level():
	if Globals.levelv == "Testing_Area":
		Globals.load_new_scene(testing_area_scene)
	if Globals.levelv == "Space_Level":
		Globals.load_new_scene(space_level_scene)
	if Globals.levelv == "Ruins_Level":
		Globals.load_new_scene(ruins_level_scene)
	if Globals.levelv == "Church_Level":
		Globals.load_new_scene(church_level_scene)

	Global_Player.load_state()
	Global_Player.load_data()