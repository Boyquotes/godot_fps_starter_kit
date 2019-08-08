extends Node

var levelv 
var levelm

# The path to the title screen scene
const MAIN_MENU_PATH = "res://Main_Menu.tscn"

#onready var inInv = false
onready var isready =false

# ------------------------------------
# All of the GUI/UI related variables
var loadgstate
# The popup scene, and a variable to hold the popup
const POPUP_SCENE = preload("res://Pause_Popup.tscn")
const POPUPinv_SCENE = preload("res://Scenes/Scene_PlayerInventory.tscn")
var popup = null

# A canvas layer node so our GUI/UI is always drawn on top
var canvas_layer = null

# The debug display scene, and a variable to hold the debug display
const DEBUG_DISPLAY_SCENE = preload("res://Debug_Display.tscn")
var debug_display = null

# ------------------------------------

# A variable to hold all of the respawn points in a level
var respawn_points = null

# A variable to hold the mouse sensitivity (so Player.gd can load it)
var mouse_sensitivity = 0.08
# A variable to hold the joypad sensitivity (so Player.gd can load it)
var joypad_sensitivity = 2

## ------------------------------------


var audio_clips = {
	"pistol_shot":preload("res://assets/general/gun_revolver_pistol_shot_04.wav"),
	"rifle_shot":preload("res://assets/general/gun_submachine_auto_shot_00_automatic_preview_01.wav"),
	"gun_cock":preload("res://assets/general/gun_semi_auto_rifle_cock_02.wav"),

	"fm_attack1":preload("res://assets/sounds/FngmAT1.wav"),
	"fm_attack2":preload("res://assets/sounds/FngmAT2.wav"),
	"fm_attack3":preload("res://assets/sounds/FngmAT3.wav"),
	"fm_attack4":preload("res://assets/sounds/FngmAT4.wav"),
	"fm_death1":preload("res://assets/sounds/FngmDT1.wav"),
	"fm_death2":preload("res://assets/sounds/FngmDT2.wav"),
	"fm_death3":preload("res://assets/sounds/FngmDT3.wav"),
	"fm_death4":preload("res://assets/sounds/FngmDT4.wav"),
	"fm_gethit1":preload("res://assets/sounds/FngmGH1.wav"),
	"fm_gethit2":preload("res://assets/sounds/FngmGH2.wav"),
	"fm_gethit3":preload("res://assets/sounds/FngmGH3.wav"),
	"fm_gethit4":preload("res://assets/sounds/FngmGH4.wav"),
	"fm_spella1":preload("res://assets/sounds/FngmSC1.wav"),
	"fm_spella2":preload("res://assets/sounds/FngmSC2.wav"),
	"fm_spella3":preload("res://assets/sounds/FngmSC3.wav"),
	"fm_spella4":preload("res://assets/sounds/FngmSC4.wav"),
	"fm_ss":preload("res://assets/sounds/FngmSS.wav"),
	"fm_walk":preload("res://assets/sounds/FngmIL.wav"),

	"bl_attack1":preload("res://assets/sounds/MilrdAT1.wav"),
	"bl_attack2":preload("res://assets/sounds/MilrdAT2.wav"),
	"bl_attack3":preload("res://assets/sounds/MilrdAT3.wav"),
	"bl_attack4":preload("res://assets/sounds/MilrdAT4.wav"),
	"bl_death1":preload("res://assets/sounds/MilrdDT1.wav"),
	"bl_death2":preload("res://assets/sounds/MilrdDT2.wav"),
	"bl_death3":preload("res://assets/sounds/MilrdDT3.wav"),
	"bl_death4":preload("res://assets/sounds/MilrdDT4.wav"),
	"bl_gethit1":preload("res://assets/sounds/MilrdGH1.wav"),
	"bl_gethit2":preload("res://assets/sounds/MilrdGH2.wav"),
	"bl_gethit3":preload("res://assets/sounds/MilrdGH3.wav"),
	"bl_gethit4":preload("res://assets/sounds/MilrdGH4.wav"),
	"bl_swing1":preload("res://assets/sounds/MilrdSW1.wav"),
	"bl_swing2":preload("res://assets/sounds/MilrdSW2.wav"),
	"bl_swing3":preload("res://assets/sounds/MilrdSW3.wav"),
	"bl_swing4":preload("res://assets/sounds/MilrdSW4.wav"),


	"rh_attack1":preload("res://assets/sounds/RnhrdAT1.wav"),
	"rh_attack2":preload("res://assets/sounds/RnhrdAT2.wav"),
	"rh_attack3":preload("res://assets/sounds/RnhrdAT4.wav"),
	"rh_attack4":preload("res://assets/sounds/RnhrdAT4.wav"),
	"rh_attacka1":preload("res://assets/sounds/RnhrdAT5.wav"),
	"rh_attacka2":preload("res://assets/sounds/RnhrdAT6.wav"),
	"rh_attacka3":preload("res://assets/sounds/RnhrdAT7.wav"),
	"rh_death1":preload("res://assets/sounds/RnhrdDT1.wav"),
	"rh_death2":preload("res://assets/sounds/RnhrdDT2.wav"),
	"rh_death3":preload("res://assets/sounds/RnhrdDT3.wav"),
	"rh_death4":preload("res://assets/sounds/RnhrdDT4.wav"),
	"rh_gethit1":preload("res://assets/sounds/RnhrdGH1.wav"),
	"rh_gethit2":preload("res://assets/sounds/RnhrdGH2.wav"),
	"rh_gethit3":preload("res://assets/sounds/RnhrdGH3.wav"),
	"rh_gethit4":preload("res://assets/sounds/RnhrdGH4.wav"),
	"rh_idle1":preload("res://assets/sounds/RnhrdIL1.wav"),
	"rh_idle2":preload("res://assets/sounds/RnhrdIL2.wav"),
	"rh_idle3":preload("res://assets/sounds/RnhrdIL3.wav"),
	"rh_idle4":preload("res://assets/sounds/RnhrdIL4.wav"),
	"rh_up1":preload("res://assets/sounds/RnhrdUP1.wav"),
	"rh_up2":preload("res://assets/sounds/RnhrdUP2.wav"),
	"rh_up3":preload("res://assets/sounds/RnhrdUP3.wav"),
	"rh_up4":preload("res://assets/sounds/RnhrdUP4.wav"),

	"ba_attack1":preload("res://assets/sounds/BalgAT1.wav"),
	"ba_attack2":preload("res://assets/sounds/BalgAT2.wav"),
	"ba_attack3":preload("res://assets/sounds/BalgAT3.wav"),
	"ba_attack4":preload("res://assets/sounds/BalgAT4.wav"),
	"ba_death1":preload("res://assets/sounds/BalgDT1.wav"),
	"ba_death2":preload("res://assets/sounds/BalgDT2.wav"),
	"ba_death3":preload("res://assets/sounds/BalgDT3.wav"),
	"ba_death4":preload("res://assets/sounds/BalgDT4.wav"),
	"ba_gethit1":preload("res://assets/sounds/BalgGH1.wav"),
	"ba_gethit2":preload("res://assets/sounds/BalgGH2.wav"),
	"ba_gethit3":preload("res://assets/sounds/BalgGH3.wav"),
	"ba_gethit4":preload("res://assets/sounds/BalgGH4.wav"),
	"ba_idle1":preload("res://assets/sounds/BalgIL1.wav"),
	"ba_idle2":preload("res://assets/sounds/BalgIL2.wav"),
	"ba_idle3":preload("res://assets/sounds/BalgIL3.wav"),
	"ba_idle4":preload("res://assets/sounds/BalgIL4.wav"),


	"th_attack1":preload("res://assets/sounds/thulkAT1.wav"),
	"th_attack2":preload("res://assets/sounds/thulkAT2.wav"),
	"th_attack3":preload("res://assets/sounds/thulkAT3.wav"),
	"th_attack4":preload("res://assets/sounds/thulkAT4.wav"),
	"th_attacka1":preload("res://assets/sounds/thulkATa1.wav"),
	"th_attacka2":preload("res://assets/sounds/thulkATa2.wav"),
	"th_attacka3":preload("res://assets/sounds/thulkATa3.wav"),
	"th_attacka4":preload("res://assets/sounds/thulkATa4.wav"),
	"th_death1":preload("res://assets/sounds/thulkDT1.wav"),
	"th_death2":preload("res://assets/sounds/thulkDT2.wav"),
	"th_death3":preload("res://assets/sounds/thulkDT3.wav"),
	"th_death4":preload("res://assets/sounds/thulkDT4.wav"),
	"th_gethit1":preload("res://assets/sounds/thulkGH1.wav"),
	"th_gethit2":preload("res://assets/sounds/thulkGH2.wav"),
	"th_gethit3":preload("res://assets/sounds/thulkGH3.wav"),
	"th_gethit4":preload("res://assets/sounds/thulkGH4.wav"),
	"th_idle1":preload("res://assets/sounds/thulkIL1.wav"),
	"th_idle2":preload("res://assets/sounds/thulkIL2.wav"),
	"th_idle3":preload("res://assets/sounds/thulkIL3.wav"),

	"sp_attack1":preload("res://assets/sounds/spAT1.wav"),
	"sp_attack2":preload("res://assets/sounds/spAT2.wav"),
	"sp_attack3":preload("res://assets/sounds/spAT3.wav"),
	"sp_attack4":preload("res://assets/sounds/spAT4.wav"),
	"sp_death1":preload("res://assets/sounds/spDT1.wav"),
	"sp_death2":preload("res://assets/sounds/spDT2.wav"),
	"sp_death3":preload("res://assets/sounds/spDT3.wav"),
	"sp_death4":preload("res://assets/sounds/spDT4.wav"),
	"sp_gethit1":preload("res://assets/sounds/spGH1.wav"),
	"sp_gethit2":preload("res://assets/sounds/spGH2.wav"),
	"sp_gethit3":preload("res://assets/sounds/spGH3.wav"),
	"sp_gethit4":preload("res://assets/sounds/spGH4.wav"),
	"sp_idle1":preload("res://assets/sounds/spIL1.wav"),
	"sp_idle2":preload("res://assets/sounds/spIL2.wav"),
	"sp_idle3":preload("res://assets/sounds/spIL3.wav"),
	"sp_idle4":preload("res://assets/sounds/spIL4.wav"),

	"sc_attack1":preload("res://assets/sounds/scAT1.wav"),
	"sc_attack2":preload("res://assets/sounds/scAT2.wav"),
	"sc_attack3":preload("res://assets/sounds/scAT3.wav"),
	"sc_attack4":preload("res://assets/sounds/scAT4.wav"),
	"sc_death1":preload("res://assets/sounds/scDT1.wav"),
	"sc_death2":preload("res://assets/sounds/scDT2.wav"),
	"sc_death3":preload("res://assets/sounds/scDT3.wav"),
	"sc_death4":preload("res://assets/sounds/scDT4.wav"),
	"sc_gethit1":preload("res://assets/sounds/scGH1.wav"),
	"sc_gethit2":preload("res://assets/sounds/scGH2.wav"),
	"sc_gethit3":preload("res://assets/sounds/scGH3.wav"),
	"sc_gethit4":preload("res://assets/sounds/scGH4.wav"),
	"sc_idle1":preload("res://assets/sounds/scIL1.wav"),
	"sc_idle2":preload("res://assets/sounds/scIL2.wav"),
	"sc_idle3":preload("res://assets/sounds/scIL3.wav"),
	"sc_idle4":preload("res://assets/sounds/scIL4.wav"),


	"sf_attack1":preload("res://assets/sounds/sfAT1.wav"),
	"sf_attack2":preload("res://assets/sounds/sfAT2.wav"),
	"sf_attack3":preload("res://assets/sounds/sfAT3.wav"),
	"sf_attack4":preload("res://assets/sounds/sfAT4.wav"),
	"sf_death1":preload("res://assets/sounds/sfDT1.wav"),
	"sf_death2":preload("res://assets/sounds/sfDT2.wav"),
	"sf_death3":preload("res://assets/sounds/sfDT3.wav"),
	"sf_death4":preload("res://assets/sounds/sfDT4.wav"),
	"sf_gethit1":preload("res://assets/sounds/sfGH1.wav"),
	"sf_gethit2":preload("res://assets/sounds/sfGH2.wav"),
	"sf_gethit3":preload("res://assets/sounds/sfGH3.wav"),
	"sf_gethit4":preload("res://assets/sounds/sfGH4.wav"),
	"sf_idle1":preload("res://assets/sounds/sfIL1.wav"),
	"sf_idle2":preload("res://assets/sounds/sfIL2.wav"),
	"sf_idle3":preload("res://assets/sounds/sfIL3.wav"),
	"sf_idle4":preload("res://assets/sounds/sfIL4.wav"),

	"mq_attack1":preload("res://assets/sounds/mqAT1.wav"),
	"mq_attack2":preload("res://assets/sounds/mqAT2.wav"),
	"mq_attack3":preload("res://assets/sounds/mqAT3.wav"),
	"mq_attack4":preload("res://assets/sounds/mqAT4.wav"),
	"mq_attacka1":preload("res://assets/sounds/mqATa1.wav"),
	"mq_attacka2":preload("res://assets/sounds/mqATa2.wav"),
	"mq_attacka3":preload("res://assets/sounds/mqATa3.wav"),
	"mq_attacka4":preload("res://assets/sounds/mqATa4.wav"),
	"mq_death1":preload("res://assets/sounds/mqDT1.wav"),
	"mq_death2":preload("res://assets/sounds/mqDT2.wav"),
	"mq_death3":preload("res://assets/sounds/mqDT3.wav"),
	"mq_death4":preload("res://assets/sounds/mqDT4.wav"),
	"mq_gethit1":preload("res://assets/sounds/mqGH1.wav"),
	"mq_gethit2":preload("res://assets/sounds/mqGH2.wav"),
	"mq_gethit3":preload("res://assets/sounds/mqGH3.wav"),
	"mq_gethit4":preload("res://assets/sounds/mqGH4.wav"),
	"mq_idle":preload("res://assets/sounds/mqIL.wav"),

	"gd_death1":preload("res://assets/sounds/gdDT1.wav"),
	"gd_death2":preload("res://assets/sounds/gdDT2.wav"),
	"gd_death3":preload("res://assets/sounds/gdDT3.wav"),
	"gd_gethit1":preload("res://assets/sounds/gdGH1.wav"),
	"gd_gethit2":preload("res://assets/sounds/gdGH2.wav"),
	"gd_gethit3":preload("res://assets/sounds/gdGH3.wav"),
	"gd_gethit4":preload("res://assets/sounds/gdGH4.wav"),
	"gd_idle1":preload("res://assets/sounds/gd_heyhero.wav"),
	"gd_idle2":preload("res://assets/sounds/gd_halt.wav"),
	"gd_idle3":preload("res://assets/sounds/gd_stayoutoftrouble.wav"),
	"gd_idle4":preload("res://assets/sounds/gd_welcome.wav"),

	"player_start":preload("res://assets/sounds/player_start.wav"),
	"player_empty":preload("res://assets/sounds/player_empty.wav"),
	"player_sensedeath":preload("res://assets/sounds/player_sensedeath.wav"),
	"player_reeks":preload("res://assets/sounds/player_reeks.wav"),
	"player_find":preload("res://assets/sounds/player_find.wav"),

	"npc_greet1":preload("res://assets/sounds/npc_greetings.wav"),
	"npc_greet2":preload("res://assets/sounds/npc_hello.wav"),
	"npc_greet3":preload("res://assets/sounds/npc_hithere.wav"),
	"npc_greet4":preload("res://assets/sounds/npc_whatchaneed.wav"),

	"fire2":preload("res://assets/sounds/fire2.wav"),
	"barrelexplode":preload("res://assets/sounds/barrelexplode.wav"),

	"pickupitem":preload("res://assets/sounds/pickupitem.wav"),
	
	"music":preload("res://assets/sounds/music.wav"),
}

## The simple audio player scene
const SIMPLE_AUDIO_PLAYER_SCENE = preload("res://Simple_Audio_Player.tscn")

## A list to hold all of the created audio nodes
var created_audio = []

## ------------------------------------


func _ready():


	## Randomize the random number generator, so we get random values
	randomize()

	## Make a new canvas layer.
	## This is so our popup always appears on top of everything else
	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)



func get_respawn_position():
	## If we do not have any respawn points, return origin
	if respawn_points == null:
		return Vector3(0, 0, 0)
	## If we have respawn points, get a random one and return it's global position
	else:
		var respawn_point = rand_range(0, respawn_points.size()-1)
		return respawn_points[respawn_point].global_transform.origin


func load_new_scene(new_scene_path):
	## Set respawn points to null so when/if we get to a level with no respawn points,
	## we do not respawn at the respawn points in the level prior.
	respawn_points = null

	## Delete all of the sounds
	for sound in created_audio:
		if (sound != null):
			sound.queue_free()
	created_audio.clear()

	## Change scenes
	get_tree().change_scene(new_scene_path)

func _process(delta):
	## If ui_cancel is pressed, we want to open a popup if one is not already open
	if Input.is_action_just_pressed("ui_cancel"):
		if isready == true:
			if popup == null:
				## Make a new popup scene
				popup = POPUP_SCENE.instance()

				## Connect the signals
				popup.get_node("Button_quit").connect("pressed", self, "popup_quit")
				popup.connect("popup_hide", self, "popup_closed")
				popup.get_node("Button_resume").connect("pressed", self, "popup_closed")
				popup.get_node("save/Button_resume").connect("pressed", self, "popup_closed")
				popup.find_node("load").get_node("Button_resume").connect("pressed", self, "popup_closed")

				## Add it as a child, and make it pop up in the center of the screen
				canvas_layer.add_child(popup)
				popup.popup_centered()

				## Make sure the mouse is visible
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

				## Pause the game
			get_tree().paused = true

	if Input.is_action_just_pressed("access_inv"):
		if isready == true:
			if popup == null:
				# Make a new popup scene
				popup = POPUPinv_SCENE.instance()

				## Connect the signals
#				popup.get_node("Button_quit").connect("pressed", self, "popup_quit")
				popup.connect("popup_hide", self, "popup_closed")
#				popup.get_node("Panel/Button_Save").connect("pressed", self, "popup_closed")

				## Add it as a child, and make it pop up in the center of the screen
				canvas_layer.add_child(popup)
				popup.popup_centered()
				popup.load_items()

				## Make sure the mouse is visible
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

				## Pause the game
				get_tree().paused = true


func popup_closed():
	## Unpause the game
	get_tree().paused = false
	get_tree().get_root().get_node(levelv).get_node("Player").get_node("HUD").visible = true

	## If we have a popup, destoy it
	if popup != null:
		popup.queue_free()
		popup = null


func popup_quit():
	get_tree().paused = false

	## Make sure the mouse is visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	## If we have a popup, destoy it
	if popup != null:
		popup.queue_free()
		popup = null

	## Go back to the title screen scene
	load_new_scene(MAIN_MENU_PATH)


func set_debug_display(display_on):
	## If we are turning off the debug display
	if display_on == false:
		## If we have a debug display, then free it and set debug_display to null
		if debug_display != null:
			debug_display.queue_free()
			debug_display = null
	## If we are turning on the debug display
	else:
		## If we do not have a debug display, instance/spawn a new one and set it to debug_display
		if debug_display == null:
			debug_display = DEBUG_DISPLAY_SCENE.instance()
			canvas_layer.add_child(debug_display)


func play_sound(sound_name, loop_sound=false, sound_position=null):
	## If we have a audio clip with with the name sound_name
	if audio_clips.has(sound_name):
		## Make a new simple audio player and set it's looping variable to the loop_sound
		var new_audio = SIMPLE_AUDIO_PLAYER_SCENE.instance()
		new_audio.should_loop = loop_sound

		## Add it as a child and add it to created_audio
		add_child(new_audio)
		created_audio.append(new_audio)

		## Send the newly created simple audio player the audio stream and sound position
		new_audio.play_sound(audio_clips[sound_name], sound_position)

	## If we do not have an audio clip with the name sound_name, print a error message
	else:
		print ("ERROR: cannot play sound that does not exist in audio_clips!")


func level_select(l):
	levelv = l
	if l == "Testing_Area":
		levelm = "testing_area_scene"
	if l == "Space_Level":
		levelm = "space_level_scene"
	if l == "Ruins_Level":
		levelm = "ruins_level_scene"
	if l == "Church_Level":
		levelm = "church_level_scene"	


func change_globalsave_var(e):
	if e == 0:
		loadgstate = 0
	if e == 1:
		loadgstate = 1
	elif e == 2:
		loadgstate = 2
	elif e == 3:
		loadgstate = 3
