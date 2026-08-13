extends Node2D

@onready var timer: RichTextLabel = $timer

var potion_collected = 0
var time = 10.0
var timer_end = false
var game_finished = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:

	# Don't do anything after the minigame is finished
	if game_finished:
		return

	# Countdown
	if time > 0:
		time -= delta
		timer.text = str(snapped(time, 0.1))
	else:
		timer_end = true

	# Win - all 3 potions collected
	if potion_collected >= 3:
		game_finished = true
		get_tree().change_scene_to_file("res://scenes/levelscene.tscn")
		return

	# Lose - timer ended before collecting all 3
	if timer_end:
		game_finished = true
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/levelscene.tscn")

func potion_collect() -> void:
	potion_collected += 1
