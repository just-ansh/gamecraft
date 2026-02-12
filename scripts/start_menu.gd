extends Node2D
@onready var start_button: Button = $Button
@onready var exit_button: Button = $Button2




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn") # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().quit() # Replace with function body.
