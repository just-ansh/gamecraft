extends Node2D
@onready var timer: Timer = $Timer

var pre = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	for a in range(20):
		var pos= Vector2(randf_range(-600,600),randf_range(-300,300)) # Replace with function body.
		var child= pre.instantiate()
		child.position=pos
		add_child(child)
		timer.start(10)
