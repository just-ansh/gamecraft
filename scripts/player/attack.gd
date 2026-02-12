extends State
@onready var state_machine: Node = $".."
@onready var area_2d: Area2D = $"../../Area2D"
@onready var attack_up: CollisionPolygon2D = $"../../Area2D/attack_up"
@onready var attack_left: CollisionPolygon2D = $"../../Area2D/attack_left"
@onready var attack_down: CollisionPolygon2D = $"../../Area2D/attack_down"
@onready var attack_right: CollisionPolygon2D = $"../../Area2D/attack_right"



@export
var move_state: State

@export
var idle_state: State
@onready var attack= {"attack_up":attack_up,"attack_down":attack_down,"attack_right":attack_right,"attack_left":attack_left}
func enter() -> void:
	super()
	parent.animations.play("attack_"+ state_machine.dire)

func process_input(event: InputEvent) -> State:
	attack["attack_"+state_machine.dire].disabled=false
	if !parent.animations.is_playing():
		attack["attack_"+state_machine.dire].disabled=true
		if Input.is_action_just_pressed('left') or Input.is_action_just_pressed('right') or Input.is_action_just_pressed('up'
		) or Input.is_action_just_pressed('down'):
			return move_state
		return idle_state
	return null



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		score+=10
		body.queue_free() # Replace with function body.
