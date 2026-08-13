extends Node2D

@onready var area: Area2D = $Area2D
@onready var collect_sound: AudioStreamPlayer = $CollectSound

func _ready() -> void:
	area.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_parent().potion_collect()
		collect_sound.play()
		hide()
