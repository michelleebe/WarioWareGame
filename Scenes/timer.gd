extends Node2D

@onready var timerlabel: RichTextLabel = $timer

var time: float

func _process(delta: float) -> void:
	timerlabel.text = str(snapped(time, 0.10))

func timer(start_time: float) -> void:
	time = start_time

	while time > 0.0:
		await wait(0.10)
		time -= 0.10

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
