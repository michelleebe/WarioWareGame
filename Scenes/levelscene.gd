extends Node2D

@onready var candy: TextureRect = $candy
@onready var candy2: TextureRect = $candy2
@onready var candy3: TextureRect = $candy3
@onready var candy4: TextureRect = $candy4
@onready var candy5: TextureRect = $candy5
@onready var level: RichTextLabel = $level
@onready var timer: RichTextLabel = $timer

var time: float

func _ready() -> void:
	await Timer(3.0)

	if Global.minigames_done < 3:
		Global.minigames_done += 1
		get_tree().change_scene_to_file(
			"res://scenes/minigame_" + str(Global.minigames_done) + ".tscn"
		)
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _process(delta: float) -> void:
	match Global.lives:
		4:
			candy.hide()

		3:
			candy.hide()
			candy2.hide()

		2:
			candy.hide()
			candy2.hide()
			candy3.hide()

		1:
			candy.hide()
			candy2.hide()
			candy3.hide()
			candy4.hide()

		0:
			candy.hide()
			candy2.hide()
			candy3.hide()
			candy4.hide()
			candy5.hide()

	timer.text = str(ceil(time))
	level.text = "Level " + str(Global.minigames_done)


func Timer(start_time: float) -> void:
	time = start_time

	while time > 0.0:
		await wait(0.1)
		time -= 0.1

	time = 0


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
