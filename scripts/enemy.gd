extends CharacterBody2D
@onready var area_2d: Area2D = $Area2D
var speed = 30
var player: CharacterBody2D = null
var direction

func _physics_process(delta: float) -> void:
	if player:
		direction= global_position.direction_to(player.global_position)
		velocity=direction*speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body
