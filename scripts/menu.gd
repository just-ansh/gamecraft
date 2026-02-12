extends Node2D
@onready var start_button: Button = $Button
@onready var exit_button: Button = $Button2
@onready var back_button: Button = $Button3
@onready var menu: Node2D = $"."


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("esc"):
		menu.visible=true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn") # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_3_pressed() -> void:
	menu.visible=false # Replace with function body.
